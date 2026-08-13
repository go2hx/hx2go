package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbFieldAccess;
import hxb.HxbType;
import hx2go.util.ExprHelper;

class RewriteStringMethod extends CompilerPass {

    static final METHODS = ["toUpperCase", "toLowerCase", "toString"];

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FInstance({ name: 'String', pack: [] }, _, { name: name })) }, _)
                if (METHODS.contains(name)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TCall({ expr: TField(e, FInstance({ name: 'String', pack: [] }, _, { name: name })) }, params):
                ExprHelper.createCallStatic(
                    context,
                    { name: 'HxString', moduleName: 'HxString', pack: ['go', 'haxe'] },
                    name,
                    [e].concat(params)
                );
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
        context.submitNode(expr, true);
    }

}
