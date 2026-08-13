package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import hxb.Typed.HxbVarKind;
import hxb.Typed.HxbVar;
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
            case TCast(e, _) if (Semantics.isInt64Type(context, expr.t)): makeDynamicCall(expr, e, 'toInt64');
            case TCast(e, _) if (Semantics.isIntegerType(context, expr.t)): makeDynamicCall(expr, e, 'toInt');
            case TCast(e, _) if (Semantics.isFloatType(context, expr.t)): makeDynamicCall(expr, e, 'toFloat');
            case TCast(e, _) if (Semantics.isBoolType(context, expr.t)): makeDynamicCall(expr, e, 'toBool');
            case TCast(e, _) if (Semantics.isStringType(context, expr.t)): makeDynamicCall(expr, e, 'toString');
            case _: expr.expr;
        }
    }

}
