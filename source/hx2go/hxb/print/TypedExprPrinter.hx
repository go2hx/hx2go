package hx2go.hxb.print;

import hx2go.hxb.Typed;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.tools.TypeTools;

/**
	Renders a `hxb.Typed.HxbTypedExpr` back to readable, Haxe-like pseudo-source.

	This is a best-effort renderer for inspection, debugging and tests — it is
	not a guaranteed round-trippable serializer. Works on every target.
**/
class TypedExprPrinter {
	final buf:StringBuf;
	var indent:Int;

	function new() {
		buf = new StringBuf();
		indent = 0;
	}

	/** Pretty-print a typed expression to a string. **/
	public static function print(e:HxbTypedExpr):String {
		final p = new TypedExprPrinter();
		p.expr(e);
		return p.buf.toString();
	}

	function pad():String {
		return StringTools.rpad("", "\t", indent);
	}

	function expr(e:HxbTypedExpr):Void {
		switch (e.expr) {
			case TConst(c): buf.add(constant(c));
			case TLocal(v): buf.add(v.name);
			case TIdent(s): buf.add(s);
			case TArray(e1, e2): expr(e1); buf.add("["); expr(e2); buf.add("]");
			case TBinop(op, e1, e2): expr(e1); buf.add(' ${binop(op)} '); expr(e2);
			case TField(e1, fa): expr(e1); buf.add("." + fieldName(fa));
			case TTypeExpr(m): buf.add(moduleType(m));
			case TParenthesis(e1): buf.add("("); expr(e1); buf.add(")");
			case TObjectDecl(fields):
				buf.add("{ ");
				buf.add([for (f in fields) f.name + ": " + nested(f.expr)].join(", "));
				buf.add(" }");
			case TArrayDecl(el):
				buf.add("[" + [for (x in el) nested(x)].join(", ") + "]");
			case TCall(e1, el):
				expr(e1);
				buf.add("(" + [for (x in el) nested(x)].join(", ") + ")");
			case TNew(c, _, el):
				buf.add("new " + c.dotPath() + "(" + [for (x in el) nested(x)].join(", ") + ")");
			case TUnop(op, postFix, e1):
				if (postFix) { expr(e1); buf.add(unop(op)); } else { buf.add(unop(op)); expr(e1); }
			case TFunction(tf):
				buf.add("function(" + [for (a in tf.args) a.v.name].join(", ") + ") ");
				expr(tf.expr);
			case TVar(v, ev):
				buf.add("var " + v.name);
				if (v.type != null) buf.add(":" + TypeTools.toString(v.type));
				if (ev != null) { buf.add(" = "); expr(ev); }
			case TBlock(el):
				if (el.length == 0) {
					buf.add("{}");
				} else {
					buf.add("{\n");
					indent++;
					for (x in el) { buf.add(pad()); expr(x); buf.add(";\n"); }
					indent--;
					buf.add(pad() + "}");
				}
			case TIf(econd, eif, eelse):
				buf.add("if ("); expr(econd); buf.add(") "); expr(eif);
				if (eelse != null) { buf.add(" else "); expr(eelse); }
			case TWhile(econd, e1, normalWhile):
				if (normalWhile) { buf.add("while ("); expr(econd); buf.add(") "); expr(e1); }
				else { buf.add("do "); expr(e1); buf.add(" while ("); expr(econd); buf.add(")"); }
			case TSwitch(subject, cases, edef):
				buf.add("switch ("); expr(subject); buf.add(") {\n");
				indent++;
				for (c in cases) {
					buf.add(pad() + "case " + [for (p in c.patterns) nested(p)].join(", ") + ": ");
					expr(c.expr); buf.add(";\n");
				}
				if (edef != null) { buf.add(pad() + "default: "); expr(edef); buf.add(";\n"); }
				indent--;
				buf.add(pad() + "}");
			case TTry(e1, catches):
				buf.add("try "); expr(e1);
				for (c in catches) { buf.add(" catch (" + c.v.name + ") "); expr(c.expr); }
			case TReturn(e1):
				buf.add("return"); if (e1 != null) { buf.add(" "); expr(e1); }
			case TBreak: buf.add("break");
			case TContinue: buf.add("continue");
			case TThrow(e1): buf.add("throw "); expr(e1);
			case TCast(e1, m): buf.add("cast "); expr(e1); if (m != null) buf.add(" (" + moduleType(m) + ")");
			case TMeta(m, e1): buf.add("@" + m.name + " "); expr(e1);
			case TEnumParameter(e1, ef, i): buf.add("enumParam("); expr(e1); buf.add(', ${ef.name}, $i)');
			case TEnumIndex(e1): buf.add("enumIndex("); expr(e1); buf.add(")");
		}
	}

	function nested(e:HxbTypedExpr):String {
		final p = new TypedExprPrinter();
		p.indent = indent;
		p.expr(e);
		return p.buf.toString();
	}

	function constant(c:HxbTConstant):String {
		return switch (c) {
			case TNull: "null";
			case TThis: "this";
			case TSuper: "super";
			case TBool(b): b ? "true" : "false";
			case TInt(i): Std.string(i);
			case TFloat(s): s;
			case TString(s): '"' + StringTools.replace(s, '"', '\\"') + '"';
		}
	}

	function fieldName(fa:HxbFieldAccess):String {
		return switch (fa) {
			case FInstance(_, _, cf) | FStatic(_, cf) | FClosureInstance(_, _, cf): cf.name == null ? "?" : cf.name;
			case FAnon(cf) | FClosureAnon(cf): cf.name;
			case FEnum(_, ef): ef.name;
			case FDynamic(s): s;
		}
	}

	function moduleType(m:HxbModuleTypeRef):String {
		return switch (m) {
			case MTClass(c) | MTEnum(c) | MTAbstract(c) | MTTypedef(c) | MTUnknown(c): c.dotPath();
		}
	}

	public static function binop(op:HxbBinop):String {
		return switch (op) {
			case OpAdd: "+"; case OpMult: "*"; case OpDiv: "/"; case OpSub: "-";
			case OpAssign: "="; case OpEq: "=="; case OpNotEq: "!="; case OpGt: ">";
			case OpGte: ">="; case OpLt: "<"; case OpLte: "<="; case OpAnd: "&";
			case OpOr: "|"; case OpXor: "^"; case OpBoolAnd: "&&"; case OpBoolOr: "||";
			case OpShl: "<<"; case OpShr: ">>"; case OpUShr: ">>>"; case OpMod: "%";
			case OpInterval: "..."; case OpArrow: "=>"; case OpIn: "in"; case OpNullCoal: "??";
			case OpAssignOp(op2): binop(op2) + "=";
		}
	}

	public static function unop(op:HxbUnop):String {
		return switch (op) {
			case OpIncrement: "++"; case OpDecrement: "--"; case OpNot: "!";
			case OpNeg: "-"; case OpNegBits: "~"; case OpSpread: "...";
		}
	}
}
