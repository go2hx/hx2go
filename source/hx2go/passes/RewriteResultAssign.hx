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

class RewriteResultAssign extends CompilerPass {

    private static var resultId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall(e, _) if (e.t != null && e.t.match(
                TFun(_, TAbstract({ name: 'Result', pack: ['go'] }, _))
            )): true;
            case _: false;
        }
    }

    public function isExtern(expr: HxbTypedExpr) {
        return switch expr.expr {
            case TField(left, FStatic(tp, ref) | FInstance(tp, _, ref)): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return false;
                }

                return switch mt {
                    case MClass(cls): {
                        var info = cls.statics.concat(cls.fields).filter(x -> x.name == ref.name)[0];
                        if ((info.flags & HxbClassFieldFlag.CfExtern) == 0 && (cls.flags & HxbClassFlag.CExtern) == 0) {
                            false;
                        } else {
                            true;
                        }
                    }

                    case _: false;
                }
            }

            case TField({ t: TType(tp, _) }, FAnon(ref)): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return false;
                }

                return switch mt {
                    case MTypedef({ type: TAnon(anon) }): { // context will collapse this if it is actual anon struct, so it *must* be extern
                        true; // since we check if return type was Result<R, E> we can assume it is extern
                    }

                    case _: false;
                }
            }

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall(e, params): {
                if (!isExtern(e)) {
                    return;
                }

                var local = Copy.copy(expr);
                var id = 'hx_result_${resultId++}';
                var tmp = new HxbVar(
                    -1,
                    id,
                    VUser(TVOLocalVariable),
                    0,
                    [],
                    expr.pos,
                    expr.t
                );

                expr.expr = TBlock([
                    new HxbTypedExpr(TVar(tmp, null), TVoid, expr.pos),
                    ExprHelper.createUntyped('${id}.Result, ${id}.Error = {0}', [local]),
                    new HxbTypedExpr(TLocal(tmp), expr.t, expr.pos)
                ]);

                context.submitNode(expr, true, 1);
            }

            case _: null;
        }
    }

}