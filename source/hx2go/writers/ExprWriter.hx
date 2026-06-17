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

class ExprWriter extends WriterImpl {

    public function writeExpr(expr: HxbTypedExpr): OutputBuffer {
        return switch expr.expr {
            case TFunction(func): writeFunction(expr, func);
            case TBlock(exprs): writeBlock(expr, exprs);
            case TCall(e, args): writeCall(expr, e, args);
            case TConst(c): writeConst(expr, c);
            case TField(e, fa): writeField(expr, e, fa);
            case TLocal(v): writeLocalAccess(expr, v);
            case TTypeExpr(ref): writeTypeAccess(expr, ref);
            case TMeta(m, e): writeExpr(e);
            case TIdent(v): writeIdent(expr, v);
            case _: new OutputBuffer();
        }
    }

    public function writeFunction(expr: HxbTypedExpr, func: HxbTFunc): OutputBuffer {
        return writeExpr(func.expr);
    }

    public function writeBlock(expr: HxbTypedExpr, exprs: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();
        buf.add("{");

        for (e in exprs) {
            buf.addBuffer(writeExpr(e), 1);
        }

        buf.add("}");

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
            case FStatic(c, cf):  StringConversions.typePathFieldName(cf.name, c);
            case FAnon(cf): '${estr}.${cf.name}';
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
            StringConversions.typePathClassName(tp)
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
