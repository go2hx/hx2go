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

class TypeNormaliserSwitch extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TSwitch(_) | TEnumParameter(_, _) | TEnumIndex(_): true;
            case _: false;
        }
    }

    public function unwrapNull(expr: HxbTypedExpr): Void {
        return switch expr.t {
            case TAbstract({ name: "Null", pack: [] }, p):
                var o = ExprHelper.createCast(expr, p[0]);
                expr.expr = o.expr;
                expr.t = o.t;
                context.submitNode(expr, true, 1);

            case _: null;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TSwitch(v, _, _) | TEnumParameter(v, _) | TEnumIndex(v): unwrapNull(v);
            case _: false;
        }
    }

}