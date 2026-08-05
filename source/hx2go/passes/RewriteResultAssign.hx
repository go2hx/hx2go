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
import haxe.runtime.Copy;
import hxb.Typed.HxbVar;

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