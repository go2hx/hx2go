package hx2go.hxb.convert;

#if macro
import haxe.macro.Context;
import hxb.Typed;
import hx2go.hxb.FieldRef;
import hxb.Ast.HxbBinop;
import hxb.Ast.HxbUnop;

using StringTools;

/**
	Converts `hxb`'s symbolic typed AST (`hxb.Typed.HxbTypedExpr`) into the
	compiler's real `haxe.macro.TypedExpr`, for use **inside macros**.

	Expression *structure* is converted exactly. The type-carrying parts (`t`,
	field/module-type references) are resolved through `haxe.macro.Context`:
	named types via `Context.getType`, fields by name on the resolved class,
	enum constructors by name on the resolved enum. Anything that cannot be
	resolved degrades gracefully (an unknown type becomes a monomorph; an
	unresolvable field becomes `FDynamic`), so conversion never throws.

	Only available with `-D macro` (i.e. in macro/build contexts).
**/
class ToMacro {
	final varCache:Map<Int, haxe.macro.Type.TVar> = new Map();
	final binops:HxbBinopToMacro;
	final unops:HxbUnopToMacro;

	public function new() {
		binops = new HxbBinopToMacro();
		unops = new HxbUnopToMacro();
	}

	/** Convert one typed expression. **/
	public static function typedExpr(e:HxbTypedExpr):haxe.macro.Type.TypedExpr {
		return new ToMacro().toTypedExpr(e);
	}

	/** Convert a type instance. **/
	public static function type(t:HxbType):haxe.macro.Type.Type {
		return new ToMacro().toType(t);
	}

	public function toTypedExpr(e:HxbTypedExpr):haxe.macro.Type.TypedExpr {
		return {expr: toDef(e.expr), pos: toPos(e.pos), t: toType(e.t)};
	}

	function toDef(d:HxbTypedExprDef):haxe.macro.Type.TypedExprDef {
		return switch (d) {
			case TConst(c): haxe.macro.Type.TypedExprDef.TConst(toConst(c));
			case TLocal(v): haxe.macro.Type.TypedExprDef.TLocal(toVar(v));
			case TArray(e1, e2): haxe.macro.Type.TypedExprDef.TArray(toTypedExpr(e1), toTypedExpr(e2));
			case TBinop(op, e1, e2): haxe.macro.Type.TypedExprDef.TBinop(binops.run(op), toTypedExpr(e1), toTypedExpr(e2));
			case TField(e1, fa): haxe.macro.Type.TypedExprDef.TField(toTypedExpr(e1), toFieldAccess(fa));
			case TTypeExpr(m): haxe.macro.Type.TypedExprDef.TTypeExpr(toModuleType(m));
			case TParenthesis(e1): haxe.macro.Type.TypedExprDef.TParenthesis(toTypedExpr(e1));
			case TObjectDecl(fields): haxe.macro.Type.TypedExprDef.TObjectDecl([for (f in fields) {name: f.name, expr: toTypedExpr(f.expr)}]);
			case TArrayDecl(el): haxe.macro.Type.TypedExprDef.TArrayDecl([for (x in el) toTypedExpr(x)]);
			case TCall(e1, el): haxe.macro.Type.TypedExprDef.TCall(toTypedExpr(e1), [for (x in el) toTypedExpr(x)]);
			case TNew(c, params, el):
				final cr = classRef(c);
				if (cr == null) // cannot resolve constructor target; fall back to a call on an ident
					haxe.macro.Type.TypedExprDef.TArrayDecl([for (x in el) toTypedExpr(x)]);
				else
					haxe.macro.Type.TypedExprDef.TNew(cr, [for (p in params) toType(p)], [for (x in el) toTypedExpr(x)]);
			case TUnop(op, postFix, e1): haxe.macro.Type.TypedExprDef.TUnop(unops.run(op), postFix, toTypedExpr(e1));
			case TFunction(tf):
				haxe.macro.Type.TypedExprDef.TFunction({
					args: [for (a in tf.args) {v: toVar(a.v), value: a.value == null ? null : toTypedExpr(a.value)}],
					t: toType(tf.t),
					expr: toTypedExpr(tf.expr)
				});
			case TVar(v, expr): haxe.macro.Type.TypedExprDef.TVar(toVar(v), expr == null ? null : toTypedExpr(expr));
			case TBlock(el): haxe.macro.Type.TypedExprDef.TBlock([for (x in el) toTypedExpr(x)]);
			case TIf(c, eif, eelse): haxe.macro.Type.TypedExprDef.TIf(toTypedExpr(c), toTypedExpr(eif), eelse == null ? null : toTypedExpr(eelse));
			case TWhile(c, e1, nw): haxe.macro.Type.TypedExprDef.TWhile(toTypedExpr(c), toTypedExpr(e1), nw);
			case TSwitch(subj, cases, edef):
				haxe.macro.Type.TypedExprDef.TSwitch(toTypedExpr(subj), [for (c in cases) {values: [for (p in c.patterns) toTypedExpr(p)], expr: toTypedExpr(c.expr)}],
					edef == null ? null : toTypedExpr(edef));
			case TTry(e1, catches):
				haxe.macro.Type.TypedExprDef.TTry(toTypedExpr(e1), [for (c in catches) {v: toVar(c.v), expr: toTypedExpr(c.expr)}]);
			case TReturn(e1): haxe.macro.Type.TypedExprDef.TReturn(e1 == null ? null : toTypedExpr(e1));
			case TBreak: haxe.macro.Type.TypedExprDef.TBreak;
			case TContinue: haxe.macro.Type.TypedExprDef.TContinue;
			case TThrow(e1): haxe.macro.Type.TypedExprDef.TThrow(toTypedExpr(e1));
			case TCast(e1, m): haxe.macro.Type.TypedExprDef.TCast(toTypedExpr(e1), m == null ? null : toModuleType(m));
			case TMeta(m, e1): haxe.macro.Type.TypedExprDef.TMeta({name: m.name, params: [], pos: toPos(m.pos)}, toTypedExpr(e1));
			case TEnumParameter(e1, ef, i):
				final er = enumField(ef);
				er == null ? haxe.macro.Type.TypedExprDef.TParenthesis(toTypedExpr(e1)) : haxe.macro.Type.TypedExprDef.TEnumParameter(toTypedExpr(e1), er, i);
			case TEnumIndex(e1): haxe.macro.Type.TypedExprDef.TEnumIndex(toTypedExpr(e1));
			case TIdent(s): haxe.macro.Type.TypedExprDef.TIdent(s);
		}
	}

	function toConst(c:HxbTConstant):haxe.macro.Type.TConstant {
		return switch (c) {
			case TNull: haxe.macro.Type.TConstant.TNull;
			case TThis: haxe.macro.Type.TConstant.TThis;
			case TSuper: haxe.macro.Type.TConstant.TSuper;
			case TBool(b): haxe.macro.Type.TConstant.TBool(b);
			case TInt(i): haxe.macro.Type.TConstant.TInt(i);
			case TFloat(s): haxe.macro.Type.TConstant.TFloat(s);
			case TString(s): haxe.macro.Type.TConstant.TString(s);
		}
	}

	function toVar(v:HxbVar):haxe.macro.Type.TVar {
		final cached = varCache.get(v.id);
		if (cached != null)
			return cached;
		final tv:haxe.macro.Type.TVar = {
			id: v.id,
			name: v.name,
			t: v.type == null ? monoType() : toType(v.type),
			capture: false,
			extra: null,
			meta: null,
			isStatic: false
		};
		varCache.set(v.id, tv);
		return tv;
	}

	function toPos(p:Pos):haxe.macro.Expr.Position {
		if (p == null || p.file == "")
			return Context.currentPos();
		return Context.makePosition({min: p.min, max: p.max, file: p.file});
	}

	// --- Types --------------------------------------------------------------

	public function toType(t:HxbType):haxe.macro.Type.Type {
		return switch (t) {
			case HxbType.TVoid: getType("Void");
			case HxbType.TInt: getType("Int");
			case HxbType.TFloat: getType("Float");
			case HxbType.TBool: getType("Bool");
			case HxbType.TString: getType("String");
			case TDynamicAny: getType("Dynamic");
			case TDynamic(t2): haxe.macro.Type.Type.TDynamic(toType(t2));
			case TMono(_): monoType();
			case TInst(c, params): rebuild(c, params, "inst");
			case TEnum(e, params): rebuild(e, params, "enum");
			case TAbstract(a, params): rebuild(a, params, "abstract");
			case TType(td, params): rebuild(td, params, "type");
			case TFun(args, ret): haxe.macro.Type.Type.TFun([for (a in args) {name: a.name, opt: a.opt, t: toType(a.t)}], toType(ret));
			case TClassStatic(c) | TEnumStatic(c) | TAbstractStatic(c): safeGet(c.dotPath());
			case TUnboundTypeParam(_) | TTypeParam(_, _) | TExprType(_) | TAnon(_): monoType();
		}
	}

	function rebuild(p:TypePath, params:Array<HxbType>, _kind:String):haxe.macro.Type.Type {
		final base = safeGet(p.dotPath());
		final mp = [for (x in params) toType(x)];
		return switch (base) {
			case haxe.macro.Type.Type.TInst(c, _): haxe.macro.Type.Type.TInst(c, mp);
			case haxe.macro.Type.Type.TEnum(e, _): haxe.macro.Type.Type.TEnum(e, mp);
			case haxe.macro.Type.Type.TAbstract(a, _): haxe.macro.Type.Type.TAbstract(a, mp);
			case haxe.macro.Type.Type.TType(td, _): haxe.macro.Type.Type.TType(td, mp);
			case other: other;
		}
	}

	function safeGet(path:String):haxe.macro.Type.Type {
		return try Context.getType(path) catch (_:Dynamic) monoType();
	}

	inline function getType(path:String):haxe.macro.Type.Type {
		return safeGet(path);
	}

	function monoType():haxe.macro.Type.Type {
		return haxe.macro.Type.Type.TMono(mkRef((null : Null<haxe.macro.Type.Type>), "?"));
	}

	// --- References ---------------------------------------------------------

	function classRef(p:TypePath):Null<haxe.macro.Type.Ref<haxe.macro.Type.ClassType>> {
		return switch (safeGet(p.dotPath())) {
			case haxe.macro.Type.Type.TInst(c, _): c;
			case _: null;
		}
	}

	function enumRef(p:TypePath):Null<haxe.macro.Type.Ref<haxe.macro.Type.EnumType>> {
		return switch (safeGet(p.dotPath())) {
			case haxe.macro.Type.Type.TEnum(e, _): e;
			case _: null;
		}
	}

	function toFieldAccess(fa:HxbFieldAccess):haxe.macro.Type.FieldAccess {
		return switch (fa) {
			case FInstance(c, params, cf):
				final cr = classRef(c);
				final fr = cr == null ? null : findField(cr, cf.name, false);
				fr == null ? haxe.macro.Type.FieldAccess.FDynamic(cf.name == null ? "" : cf.name) : haxe.macro.Type.FieldAccess.FInstance(cr, [for (p in params) toType(p)], fr);
			case FStatic(c, cf):
				final cr = classRef(c);
				final fr = cr == null ? null : findField(cr, cf.name, true);
				fr == null ? haxe.macro.Type.FieldAccess.FDynamic(cf.name == null ? "" : cf.name) : haxe.macro.Type.FieldAccess.FStatic(cr, fr);
			case FClosureInstance(c, params, cf):
				final cr = classRef(c);
				final fr = cr == null ? null : findField(cr, cf.name, false);
				fr == null ? haxe.macro.Type.FieldAccess.FDynamic(cf.name == null ? "" : cf.name) : haxe.macro.Type.FieldAccess.FClosure({c: cr, params: [for (p in params) toType(p)]}, fr);
			case FAnon(cf) | FClosureAnon(cf):
				haxe.macro.Type.FieldAccess.FDynamic(cf.name);
			case FEnum(e, ef):
				final er = enumRef(e);
				final field = enumField(ef);
				(er == null || field == null) ? haxe.macro.Type.FieldAccess.FDynamic(ef.name) : haxe.macro.Type.FieldAccess.FEnum(er, field);
			case FDynamic(s):
				haxe.macro.Type.FieldAccess.FDynamic(s);
		}
	}

	function findField(cr:haxe.macro.Type.Ref<haxe.macro.Type.ClassType>, name:Null<String>, isStatic:Bool):Null<haxe.macro.Type.Ref<haxe.macro.Type.ClassField>> {
		if (name == null)
			return null;
		final ct = try cr.get() catch (_:Dynamic) null;
		if (ct == null)
			return null;
		final list = isStatic ? ct.statics.get() : ct.fields.get();
		for (f in list)
			if (f.name == name)
				return mkRef(f, name);
		// constructor
		if (ct.constructor != null && name == "new")
			return ct.constructor;
		return null;
	}

	function enumField(ef:EnumFieldRef):Null<haxe.macro.Type.EnumField> {
		final er = enumRef(ef.owner);
		if (er == null)
			return null;
		final et = try er.get() catch (_:Dynamic) null;
		if (et == null)
			return null;
		return et.constructs.get(ef.name);
	}

	function toModuleType(m:HxbModuleTypeRef):haxe.macro.Type.ModuleType {
		final path = switch (m) {
			case MTClass(c) | MTEnum(c) | MTAbstract(c) | MTTypedef(c) | MTUnknown(c): c;
		};
		return switch (safeGet(path.dotPath())) {
			case haxe.macro.Type.Type.TInst(c, _): haxe.macro.Type.ModuleType.TClassDecl(c);
			case haxe.macro.Type.Type.TEnum(e, _): haxe.macro.Type.ModuleType.TEnumDecl(e);
			case haxe.macro.Type.Type.TAbstract(a, _): haxe.macro.Type.ModuleType.TAbstract(a);
			case _:
				// last-ditch: synthesize a class ref so the node stays well-formed
				haxe.macro.Type.ModuleType.TClassDecl(mkRef(null, path.dotPath()));
		}
	}

	static function mkRef<T>(v:T, name:String):haxe.macro.Type.Ref<T> {
		return {get: () -> v, toString: () -> name};
	}
}

/** Maps `hxb` binops to `haxe.macro.Expr.Binop`. **/
private class HxbBinopToMacro {
	public function new() {}

	public function run(op:HxbBinop):haxe.macro.Expr.Binop {
		return switch (op) {
			case OpAdd: OpAdd; case OpMult: OpMult; case OpDiv: OpDiv; case OpSub: OpSub;
			case OpAssign: OpAssign; case OpEq: OpEq; case OpNotEq: OpNotEq; case OpGt: OpGt;
			case OpGte: OpGte; case OpLt: OpLt; case OpLte: OpLte; case OpAnd: OpAnd;
			case OpOr: OpOr; case OpXor: OpXor; case OpBoolAnd: OpBoolAnd; case OpBoolOr: OpBoolOr;
			case OpShl: OpShl; case OpShr: OpShr; case OpUShr: OpUShr; case OpMod: OpMod;
			case OpInterval: OpInterval; case OpArrow: OpArrow; case OpIn: OpIn;
			case OpNullCoal: OpNullCoal;
			case OpAssignOp(o): OpAssignOp(run(o));
		}
	}
}

/** Maps `hxb` unops to `haxe.macro.Expr.Unop`. **/
private class HxbUnopToMacro {
	public function new() {}

	public function run(op:HxbUnop):haxe.macro.Expr.Unop {
		return switch (op) {
			case OpIncrement: OpIncrement; case OpDecrement: OpDecrement; case OpNot: OpNot;
			case OpNeg: OpNeg; case OpNegBits: OpNegBits; case OpSpread: OpSpread;
		}
	}
}
#end
