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
import hx2go.normaliser.Semantics;

class SwitchDefault extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TSwitch(subject, cases, edef) if (edef == null): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var p = Semantics.allPathsReturn(expr);

        if (!p.allPathsReturn && expr.t.match(TVoid)) {
            return;
        }

        var o = if (p.allPathsReturn) {
            new HxbTypedExpr(TThrow(ExprHelper.createUntyped('"unreachable"', [])), TVoid, null);
        } else {
            new HxbTypedExpr(TReturn(ExprHelper.createUntyped('return HxDefault[${context.getWriter().types.writeHxbType(expr.t)}]()', [])), expr.t, null);
        }

        context.submitNode(o, true);

        expr.expr = switch expr.expr {
            case TSwitch(subject, cases, edef): TSwitch(subject, cases, o);
            case _: expr.expr;
        }
    }

}