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

class TypeNormaliserReturn extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TReturn(e): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch [expr.expr, frame.field.type] {
            case [TReturn(e), TFun(_, want)] if (e?.t != null && !TypeHelper.compare(e.t, want)):
                var o = ExprHelper.createCast(e, want);
                context.submitNode(o, true);

                expr.expr = TReturn(o);

            case _: null;
        }
    }

}