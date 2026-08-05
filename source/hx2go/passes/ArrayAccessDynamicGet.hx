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
import hx2go.util.TypeHelper;

class ArrayAccessDynamicGet extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TArray(e, _):
                switch TypeHelper.follow(context, e.t) {
                    case TDynamic(_) | TDynamicAny: true;
                    case _: false;
                }
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TArray(e, eidx):
                var call = ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'haxe'] }, 'getArrayIndex', [e, eidx]);
                ExprHelper.createCast(call, expr.t);
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
        
        context.submitNode(expr, true);
    }

}