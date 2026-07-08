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

class CastDynamicFrom extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch expr.expr {
            case TCast({ t: TDynamicAny | TDynamic(_) }, _): true;
            case _: false;
        }
    }

    public function makeDynamicCall(expr: HxbTypedExpr, inner: HxbTypedExpr, call: String): HxbTypedExprDef {
        var o = ExprHelper.createCast( // NOTE: extra cast if it is a specialized type (so not int, but int8 for example)
            ExprHelper.createCallStatic(
                context,
                {
                    name: 'HxDynamic',
                    moduleName: 'HxDynamic',
                    pack: ['go', 'haxe']
                },
                call,
                [inner]
            )
            , expr.t);

        context.submitNode(o, true);

        return o.expr;
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        expr.expr = switch expr.expr {
            case TCast(e, _) if (Semantics.isIntegerType(expr.t)): makeDynamicCall(expr, e, 'toInt');
            case TCast(e, _) if (Semantics.isFloatType(expr.t)): makeDynamicCall(expr, e, 'toFloat');
            case TCast(e, _) if (Semantics.isBoolType(expr.t)): makeDynamicCall(expr, e, 'toBool');
            case TCast(e, _) if (Semantics.isStringType(expr.t)): makeDynamicCall(expr, e, 'toString');
            case _: expr.expr;
        }
    }

}
