package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;
import hx2go.preprocessor.Semantics;

class CastDynamic extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCast({ t: TDynamicAny | TDynamic(_) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        expr.expr = switch expr.expr {
            case TCast(e, _) if (Semantics.isIntegerType(expr.t)):
                ExprHelper.createCast(
                    ExprHelper.createCallStatic(
                        context,
                        {
                            name: 'HxDynamic',
                            moduleName: 'HxDynamic',
                            pack: ['go', 'hx2go']
                        },
                        'valueToInt',
                        [e]
                    )
                , expr.t).expr;

            case _: expr.expr;
        }
    }

}
