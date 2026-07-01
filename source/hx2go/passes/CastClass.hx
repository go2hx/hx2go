package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;
import hx2go.normaliser.Semantics;
import hx2go.util.StringConversions;
import hx2go.hxb.flags.HxbClassFlag;

class CastClass extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TInst(_) | TDynamic(_) | TDynamicAny }, _), t: TInst(_) }: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr {
            case { expr: TCast(e, _), t: TInst(tp, _) }:
                switch e.t {
                    case TInst(ftp, _) if (ftp.dotPath() == tp.dotPath()): {
                        expr.expr = e.expr;
                        return;
                    }

                    case _: null;
                }

                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var cls = switch m {
                    case MClass(x): x;
                    case _: return;
                }

                if (cls.flags & HxbClassFlag.CExtern != 0) {
                    return;
                }

                var isDyn = e.t.match(TDynamic(_) | TDynamicAny);
                if (isDyn) {
                    var o = ExprHelper.createCast(ExprHelper.createCallStatic(context, {
                        name: "HxDynamic",
                        moduleName: "HxDynamic",
                        pack: ["go", "hx2go"]
                    }, "toClass", [e, new HxbTypedExpr(TConst(TString(StringConversions.typePathClassInstanceName(cls.path))), TString, null)]), expr.t);

                    expr.expr = o.expr;
                    expr.t = o.t;

                    context.submitNode(expr, true, 1);
                } else {
                    expr.expr = ExprHelper.createUntyped('&{0}.${StringConversions.typePathClassInstanceName(cls.path)}', [e]).expr;
                }

            case _: null;
        }
    }

}
