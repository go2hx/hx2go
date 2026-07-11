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
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbClassField;
import haxe.runtime.Copy;

class RewriteMethodAssign extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign, { expr: TField(_, FInstance(_)) }, { t: TFun(_) }): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TBinop(OpAssign, { expr: TField(e, FInstance(tp, p, cf)), t: ft }, ae): {
                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var current: HxbClass = switch m {
                    case MClass(x): x;
                    case _: return;
                }

                var fields = current.fields.filter(f -> f.kind.match(KMethod(MethDynamic)) && f.name == cf.name);
                if (fields.length == 0) {
                    return;
                }

                expr.expr = TBinop(
                    OpAssign,
                    new HxbTypedExpr(
                        TField(
                            Copy.copy(e),
                            FInstance(tp, p, {
                                owner: cf.owner,
                                kind: cf.kind,
                                name: '${StringConversions.nameToFieldName(cf.name)}_Dyn',
                                depth: cf.depth
                            })
                        ),
                        ft,
                        expr.pos
                    ),
                    ae
                );

                ae.t = context.getWriter().classes.appendThis(ae.t, current);
            };

            case _: null;
        }
    }

}