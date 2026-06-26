package hx2go.writers;

using StringTools;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.util.OutputBuffer;
import hx2go.hxb.Typed.HxbTFunc;
import hx2go.hxb.Typed.HxbTConstant;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.StringConversions;
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Typed.HxbModuleTypeRef;
import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef.TConst;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.util.TypeHelper;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbTObjectField;
import hx2go.hxb.HxbType;
import hx2go.hxb.TypePath;

class ExprWriter extends WriterImpl {

    public function writeExpr(expr: HxbTypedExpr, topLevel: Bool = false): OutputBuffer {
        return switch expr.expr {
            case TFunction(func): writeFunction(expr, func, topLevel);
            case TBlock(exprs): writeBlock(expr, exprs);
            case TCall(e, args): writeCall(expr, e, args);
            case TConst(c): writeConst(expr, c);
            case TField(e, fa): writeField(expr, e, fa);
            case TLocal(v): writeLocalAccess(expr, v);
            case TTypeExpr(ref): writeTypeAccess(expr, ref);
            case TMeta(m, e): writeExpr(e);
            case TIdent(v): writeIdent(expr, v);
            case TCast(e, ref): writeCast(expr, e, ref);
            case TVar(v, e): writeVarDecl(expr, v, e);
            case TUnop(op, postFix, e): writeUnop(expr, op, postFix, e);
            case TParenthesis(e): writeParenthesis(expr, e);
            case TWhile(econd, ebody, normal): writeWhile(expr, econd, ebody, normal);
            case TIf(econd, eif, eelse): writeIfStmt(expr, econd, eif, eelse);
            case TBinop(op, left, right): writeBinop(expr, op, left, right);
            case TReturn(e): writeReturn(e);
            case TObjectDecl(fields): writeObjectDecl(expr, fields);
            case TArrayDecl(elements): writeArrayDecl(expr, elements);
            case TArray(e, idx): writeArrayAccess(expr, e, idx);
            case TNew(tp, params, el): writeNew(expr, tp, params, el);
            case TBreak: new OutputBuffer("break");
            case TContinue: new OutputBuffer("continue");
            case _: new OutputBuffer();
        }
    }

    public function writeNew(expr: HxbTypedExpr, tp: TypePath, params: Array<HxbType>, el: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();
        var mod = writer.context.resolve(tp);
        var path = StringConversions.moduleTypeGetTypePath(mod);

        buf.addInline('${StringConversions.typePathClassInstanceName(path)}_CreateInstance(');

        for (argIdx in 0...el.length) {
            var arg = el[argIdx];
            buf.addBufferInline(writeExpr(arg));

            if (argIdx != el.length - 1) {
                buf.addInline(", ");
            }
        }

        buf.addInline(')');

        return buf;
    }

    public function writeArrayDecl(expr: HxbTypedExpr, elements: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline("&([]");
        buf.addBufferInline(switch expr.t {
            case TInst(_, params): writer.types.writeHxbType(params[0]);
            case _: throw "type is not array type for arrayDecl?";
        });

        if (elements.length == 0) buf.addInline('{}');
        else {
            buf.addInline('{ ');

            for (idx in 0...elements.length) {
                buf.addBufferInline(writeExpr(elements[idx]));
                if (idx < elements.length - 1) {
                    buf.addInline(', ');
                }
            }

            buf.addInline(' }');
        }

        buf.addInline(')');

        return buf;
    }

    public function writeArrayAccess(expr: HxbTypedExpr, e: HxbTypedExpr, eidx: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('(*');
        buf.addBufferInline(writeExpr(e));
        buf.addInline(')');
        buf.addInline('[');
        buf.addBufferInline(writeExpr(eidx));
        buf.addInline(']');

        return buf;
    }

    public function writeObjectDecl(expr: HxbTypedExpr, fields: Array<HxbTObjectField>): OutputBuffer {
        var buf = new OutputBuffer();
        buf.addBufferInline(writer.types.writeHxbType(expr.t));
        buf.addInline('{ ');

        for (i in 0...fields.length) {
            var field = fields[i];

            buf.addInline('"${field.name}": ');
            buf.addBufferInline(writeExpr(field.expr));

            if (i < fields.length - 1) {
                buf.addInline(', ');
            }
        }

        buf.addInline(' }');

        return buf;
    }

    public function writeFunction(expr: HxbTypedExpr, func: HxbTFunc, topLevel: Bool): OutputBuffer {
        if (topLevel) return writeExpr(func.expr);
        else {
            var buf = new OutputBuffer();
            var returnType: HxbType = TVoid;

            switch expr.t {
                case TFun(params, ret): buf.addInline('func(${params.map(p -> '${p.name} ${writer.types.writeHxbType(p.t)}').join(', ')}) ${ret == TVoid ? '' : '${writer.types.writeHxbType(ret)}'} ');
                case _: null;
            }

            buf.addBufferInline(writeExpr(func.expr));

            return buf;
        }
    }

    public function writeReturn(expr: Null<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer("return");

        if (expr != null) {
            buf.addInline(' ');
            buf.addBufferInline(writeExpr(expr));
        }

        return buf;
    }

    public function writeBlock(expr: HxbTypedExpr, exprs: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();
        buf.add("{");

        for (e in exprs) {
            if (buf.endedWithBlock()) {
                buf.add(''); // makes code more readable when you deal with nesting
            }

            buf.addBuffer(writeExpr(e), 1);
        }

        buf.addInline("}");

        return buf;
    }

    public function writeCast(expr: HxbTypedExpr, e: HxbTypedExpr, ref: HxbModuleTypeRef): OutputBuffer {
        var buf = new OutputBuffer();

        if (e.t == null) {
            return writeExpr(e);
        }

        switch e.t {
            case TDynamic(_) | TDynamicAny:
                buf.addInline('(');
                buf.addBufferInline(writeExpr(e));
                buf.addInline(').(');
                buf.addBufferInline(writer.types.writeHxbType(expr.t));
                buf.addInline(')');

            case _:
                buf.addBufferInline(writer.types.writeHxbType(expr.t));
                buf.addInline('(');
                buf.addBufferInline(writeExpr(e));
                buf.addInline(')');

        }

        return buf;
    }

    public function writeIfStmt(expr: HxbTypedExpr, econd: HxbTypedExpr, eif: HxbTypedExpr, eelse: Null<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('if ');
        buf.addBufferInline(writeExpr(econd));
        buf.addInline(' ');
        buf.addBufferInline(writeExpr(eif));

        if (eelse != null) {
            buf.addInline(' else ');
            buf.addBufferInline(writeExpr(eelse));
        }

        return buf;
    }

    public function writeWhile(expr: HxbTypedExpr, econd: HxbTypedExpr, ebody: HxbTypedExpr, normalWhile: Bool): OutputBuffer {
        var buf = new OutputBuffer(); // TODO: handle normalWhile (do {} while(...) vs while (...) {})

        buf.addInline('for ');
        buf.addBufferInline(writeExpr(econd));
        buf.addInline(' ');
        buf.addBufferInline(writeExpr(ebody));

        return buf;
    }

    public function writeParenthesis(expr: HxbTypedExpr, e: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('(');
        buf.addBufferInline(writeExpr(e));
        buf.addInline(')');

        return buf;
    }

    public function writeCall(expr: HxbTypedExpr, ecall: HxbTypedExpr, args: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();
        var estr = writeExpr(ecall);

        if (estr.toString() == "__go__") { // untyped __go__();
            var cpy = args.copy();
            return writeRaw(cpy.shift(), cpy);
        }

        buf.addBufferInline(estr);
        buf.addInline("(");

        for (argIdx in 0...args.length) {
            var arg = args[argIdx];
            buf.addBufferInline(writeExpr(arg));

            if (argIdx != args.length - 1) {
                buf.addInline(", ");
            }
        }

        buf.addInline(")");

        return buf;
    }

    public function writeVarDecl(expr: HxbTypedExpr, v: HxbVar, vexpr: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();
        buf.addInline('var ${v.name} ');
        buf.addBufferInline(writer.types.writeHxbType(v.type));

        if (vexpr != null) {
            buf.addInline(' = ');
            buf.addBufferInline(writeExpr(vexpr));
        }

        buf.addInline('; _ = ${v.name}');
        return buf;
    }

    public function writeBinop(expr: HxbTypedExpr, op: HxbBinop, left: HxbTypedExpr, right: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();
        var opStr = switch (op) {
            case OpAdd: "+";
            case OpSub: "-";
            case OpMult: "*";
            case OpDiv: "/";
            case OpAssign: "=";
            case OpEq: "==";
            case OpNotEq: "!=";
            case OpGt: ">";
            case OpGte: ">=";
            case OpLt: "<";
            case OpLte: "<=";
            case OpAnd: "&";
            case OpOr: "|";
            case OpXor: "^";
            case OpBoolAnd: "&&";
            case OpBoolOr: "||";
            case OpShl: "<<";
            case OpShr: ">>";
            case OpUShr: ""; // throw "OpUShr not supported"; // TODO: preprocess as this isn't valid
            case OpMod: "%";
            case OpInterval: throw "OpInterval not supported";  // TODO: preprocess as this isn't valid
            case OpArrow: throw "OpArrow not supported"; // TODO: preprocess as this isn't valid
            case OpIn: throw "OpIn not supported"; // TODO: preprocess as this isn't valid
            case OpNullCoal: throw "OpNullCoal not supported"; // TODO: preprocess as this isn't valid

            case OpAssignOp(inner):
                switch (inner) {
                    case OpAdd: "+=";
                    case OpSub: "-=";
                    case OpMult: "*=";
                    case OpDiv: "/=";
                    case OpAnd: "&=";
                    case OpOr: "|=";
                    case OpXor: "^=";
                    case OpShl: "<<=";
                    case OpShr: ">>=";
                    case OpUShr: throw "OpUShr not supported";  // TODO: preprocess as this isn't valid
                    case OpMod: "%=";
                    default:
                        throw 'Unsupported assignment operator: $inner';
                }
        };

        // if (op != OpAssign) buf.addInline('(');
        buf.addBufferInline(writeExpr(left));
        buf.addInline(' $opStr ');
        buf.addBufferInline(writeExpr(right));
        // if (op != OpAssign) buf.addInline(')');

        return buf;
    }

    public function writeUnop(expr: HxbTypedExpr, op: HxbUnop, postFix: Bool, e: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();
        var op = switch op {
            case OpIncrement: "++";
            case OpDecrement: "--";
            case OpNot: "!";
            case OpNeg: "-";
            case OpNegBits: "^";
            case OpSpread: throw "OpSpread not supported"; // TODO: preprocess as this isn't valid
        }

        if (!postFix) {
            buf.addInline(op);
        }

        buf.addBufferInline(writeExpr(e));

        if (postFix) {
            buf.addInline(op);
        }

        return buf;
    }

    public function writeConst(expr: HxbTypedExpr, c: HxbTConstant): OutputBuffer {
        var str = switch c {
            case TNull: "nil";
            case TThis: "this";
            case TSuper: "super";
            case TBool(v): Std.string(v);
            case TInt(v): Std.string(v);
            case TFloat(v): v;
            case TString(v): StringConversions.quoteString(v);
        }

        return new OutputBuffer(str);
    }

    public function writeField(expr: HxbTypedExpr, e: HxbTypedExpr, fa: HxbFieldAccess): OutputBuffer {
        var estr = writeExpr(e);
        var str = switch fa {
            case FInstance(c, params, cf): '${estr}.${cf.name}';
            case FStatic(c, cf):  StringConversions.typePathStaticFieldName(cf.name, c);
            case FAnon(cf): '${estr}["${cf.name}"]';
            case FClosureInstance(c, params, cf): '${estr}.${cf.name}';
            case FClosureAnon(cf): '${estr}.${cf.name}';
            case FEnum(e, ef): '${estr}.${ef.name}';
            case FDynamic(s): '${estr}.${s}';
        }

        return new OutputBuffer(str);
    }

    public function writeLocalAccess(expr: HxbTypedExpr, v: HxbVar): OutputBuffer {
        return new OutputBuffer(v.name);
    }

    public function writeTypeAccess(expr: HxbTypedExpr, ref: HxbModuleTypeRef): OutputBuffer {
        var tp = switch ref {
            case MTClass(x) | MTEnum(x) | MTAbstract(x) | MTTypedef(x) | MTUnknown(x): x;
        }

        return new OutputBuffer(
            StringConversions.typePathClassInstanceName(tp)
        );
    }

    public function writeRaw(template: HxbTypedExpr, args: Array<HxbTypedExpr>): OutputBuffer {
        var tmpstr = switch template?.expr {
            case TConst(TString(x)): x;
            case _: "";
        }

        for (idx in 0...args.length) {
            tmpstr = tmpstr.replace('{$idx}', writeExpr(args[idx]).toString());
        }

        return new OutputBuffer(tmpstr);
    }

    public function writeIdent(expr: HxbTypedExpr, ident: String): OutputBuffer {
        return new OutputBuffer(ident);
    }

}
