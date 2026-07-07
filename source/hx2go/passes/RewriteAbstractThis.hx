package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;
import hx2go.util.StringConversions;
import hx2go.util.StringConversions.StringConversions.typePathClassInstanceName;
import hx2go.hxb.Typed.HxbFieldAccess;

class RewriteAbstractThis extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TLocal({ kind: VAbstractThis }): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
       switch expr.expr {
           case TLocal(v) if (v.meta.filter(m -> m.name == ":this").length != 0): {
               v.name = "this";
           }

           case _: null;
       }
    }

}