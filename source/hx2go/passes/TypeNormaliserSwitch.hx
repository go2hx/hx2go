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