package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.flags.HxbClassFlag;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.hxb.Ast.HxbExpr;
import hx2go.hxb.Ast.HxbExprDef.EObjectDecl;
import hx2go.hxb.Ast.HxbExprDef.EConst;
import hx2go.hxb.Ast.HxbExprDef.EArrayDecl;
import hx2go.hxb.HxbModuleType;
import hx2go.util.ExprHelper;
import hx2go.util.StringConversions;
import hx2go.hxb.Ast.HxbObjectField;
import hx2go.util.ObjectFieldHelper;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;
import hx2go.util.TypeHelper;

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