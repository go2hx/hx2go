package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.flags.HxbClassFlag;
import hxb.Typed.HxbFieldAccess;
import hxb.Ast.HxbExpr;
import hxb.Ast.HxbExprDef.EObjectDecl;
import hxb.Ast.HxbExprDef.EConst;
import hxb.Ast.HxbExprDef.EArrayDecl;
import hxb.HxbModuleType;
import hx2go.util.ExprHelper;
import hx2go.util.StringConversions;
import hxb.Ast.HxbObjectField;
import hx2go.util.ObjectFieldHelper;
import hxb.HxbType;
import haxe.runtime.Copy;
import hx2go.util.TypeHelper;
import hx2go.normaliser.ExprCopy;
import hxb.tools.ExprTools;
import hxb.tools.TypedExprTools;

class TypeNormaliserArray extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TArrayDecl(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var elements = switch expr.expr {
            case TArrayDecl(x): x;
            case _: return;
        }

        var elementType = switch expr.t {
            case TInst({ name: "Array", pack: [], }, p): p[0];
            case _: expr.t; // should not be able to reach
        }

        for (el in elements) {
            if (!TypeHelper.compare(el.t, elementType)) {
                var o = ExprHelper.createCast(el, elementType);
                el.expr = o.expr;
                el.t = o.t;

                context.submitNode(el, true);
            }
        }
    }

}