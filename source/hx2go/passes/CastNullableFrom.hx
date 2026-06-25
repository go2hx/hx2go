package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbTypedExprDef;

class CastNullableFrom extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch expr.expr {
            case TCast({ t: t }, _) if (t != null && t.match(TAbstract({ pack: [], name: "Null" }, _))): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        switch expr.expr {
            case TCast(e, _) if (!expr.t.match(TAbstract({ pack: [], name: "Null" }, _))): {
                if (e.t == null) {
                    return;
                }

                var o = ExprHelper.createUntyped('{0}.Value', [e]);
                var type = switch e.t {
                    case TAbstract(_, p): p[0];
                    case _: e.t;
                }

                o.t = type;

                if (expr.t.match(TDynamic(_) | TDynamicAny)) {
                    o = ExprHelper.createUntyped('(map[bool]any{true: {0}.Value, false: nil})[{0}.Valid]', [e]);
                } else if (!TypeHelper.compare(type, expr.t)) {
                    o = ExprHelper.createCast(o, expr.t);
                    context.submitNode(o, true);
                }

                expr.expr = o.expr;
            }

            case _: null;
        }
    }

}