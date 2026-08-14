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
import hxb.flags.HxbClassFieldFlag;
import hxb.Typed.HxbVar;

class RewriteResultSwitchParam extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TEnumParameter(e, _) if (e.t != null && e.t.match(TEnum({ pack: ['go'], name: 'ResultKind' }, _))): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TEnumParameter(e, ref, 0):
                var kind = ref.name == "Ok" ? "Result" : "Error";
                var access = ExprHelper.createUntyped('{0}.${kind}', [ hx2go.normaliser.ExprCopy.copy(e) ]);

                expr.expr = access.expr;
                context.submitNode(expr, true);

            case _: null;
        }
    }

}