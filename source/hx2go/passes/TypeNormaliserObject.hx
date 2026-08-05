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

class TypeNormaliserObject extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TObjectDecl(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var fields = switch expr.expr {
            case TObjectDecl(x): x;
            case _: return;
        }

       for (f in fields) {
           if (!f.expr.t.match(TDynamic(_) | TDynamicAny)) {
               var o = ExprHelper.createCast(f.expr, TDynamicAny);
               f.expr.expr = o.expr;
               f.expr.t = o.t;

               context.submitNode(f.expr, true);
           }
       }
    }

}