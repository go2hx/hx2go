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
import hx2go.normaliser.Semantics;

class TypeNormaliserIf extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TIf(_, eif, eelse): true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TIf(econd, eif, eelse): {
                if (econd.t != null
                        && (econd.t.match(TDynamic(_) | TDynamicAny)
                        || Semantics.isNullableType(econd.t))
                    ) {
                    var o = ExprHelper.createCast(econd, TBool);
                    econd.expr = o.expr;
                    econd.t = o.t;

                    context.submitNode(econd, true);
                }

                if (expr.t.match(TVoid)) {
                    return;
                }

                if (!TypeHelper.compare(eif.t, expr.t)) {
                    var o = ExprHelper.createCast(eif, expr.t);
                    eif.expr = o.expr;
                    eif.t = o.t;

                    context.submitNode(eif, true);
                }


                if (eelse != null && !TypeHelper.compare(eelse.t, expr.t)) {
                    var o = ExprHelper.createCast(eelse, expr.t);
                    eelse.expr = o.expr;
                    eelse.t = o.t;

                    context.submitNode(eelse, true);
                }
            }

            case _: null;
        }
    }

}