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
import hx2go.hxb.flags.HxbClassFieldFlag;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbVar;

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
                var access = ExprHelper.createUntyped('{0}.${kind}', [ Copy.copy(e) ]);

                expr.expr = access.expr;
                context.submitNode(expr, true);

            case _: null;
        }
    }

}