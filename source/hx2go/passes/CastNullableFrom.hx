package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.preprocessor.Semantics;
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
                var o = ExprHelper.createUntyped('{0}.Value', [e]);
                var type = switch e.t {
                    case TAbstract(_, p): p[0];
                    case _: e.t;
                }

                if (!TypeHelper.compare(type, expr.t)) {
                    o.t = type;
                    o = ExprHelper.createCast(o, expr.t);
                }

                expr.expr = o.expr;
                expr.t = o.t;
            }

            case _: null;
        }
    }

}