package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.util.TypeHelper;
import hx2go.util.StringConversions;
import hxb.flags.HxbClassFlag;
import hxb.Typed.HxbVar;

class CastPointerInterface extends CompilerPass {

    private var castId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch expr.expr {
            case TCast({ expr: TCast({ t: TAbstract({ name: "Pointer", pack: ["go"] }, [t1]) }, _), t: t2 }, _) if (TypeHelper.compare(t1, t2) && !TypeHelper.compare(t1, expr.t) && expr.t.match(TType(_))): {
                true;
            }

            case TCast(e, _) if (expr.t.match(TType(_)) && e.t.match(TInst(_))): {
                true;
            }

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCast({ expr: TCast(inner, _), t: t2 }, _) if (inner.t.match(TAbstract({ name: "Pointer", pack: ["go"] }, _))): {
                var o = ExprHelper.createCast(inner, expr.t);
                expr.expr = o.expr;
                expr.t = o.t;

                context.submitNode(expr, true);
            }

            case TCast(e, _) if (expr.t.match(TType(_)) && e.t.match(TInst(_))): {
                var m = switch expr.t {
                    case TType(tp, _): context.resolve(tp);
                    case _: return;
                }

                if (m == null) {
                    return;
                }

                var td = switch m {
                    case MTypedef(t): t;
                    case _: return;
                }

                var ecls = switch e.t {
                    case TInst(tp, _): switch context.resolve(tp) {
                        case MClass(cls): cls.flags & HxbClassFlag.CExtern == 0;
                        case _: false;
                    }

                    case _: false;
                }

                if (td.meta.filter(mm -> mm.name == ":go.Type").length > 0) {
                    if (ecls) {
                        return;
                    }

                    var o = ExprHelper.createUntyped("(&({0}))", [hx2go.normaliser.ExprCopy.copy(e)]);
                    e.expr = o.expr;

                    context.submitNode(e, true);
                    return;
                }
                
                switch context.normalize(td.type) {
                    case TInst(itp, _): {
                        var isIface = switch context.resolve(itp) {
                            case MClass(icls): icls.flags & HxbClassFlag.CInterface != 0;
                            case _: false;
                        }

                        if (!isIface) {
                            return;
                        }

                        var ifaceMt = context.resolve(itp);
                        var ifaceName = StringConversions.typePathClassInstanceName(ifaceMt == null ? itp : StringConversions.moduleTypeGetTypePath(ifaceMt));
                        var ifaceCls = switch ifaceMt {
                            case MClass(x): x;
                            case _: null;
                        }

                        // check if it's already the interface
                        var operandIsIface = switch context.normalize(e.t) {
                            case TInst(etp, _): context.resolvedInstanceName(etp) == ifaceName;
                            case _: false;
                        }

                        expr.expr = operandIsIface
                            ? ExprHelper.createUntyped('(*$ifaceName)({0})', [hx2go.normaliser.ExprCopy.copy(e)]).expr
                            : {
                                var cst = ExprHelper.createUntyped('&$ifaceName{ VTable: {0}.VTable.(${StringConversions.typePathClassVTableName(ifaceCls?.path)}) }', [e]);
                                var tmp = new HxbVar(-1, 'hx_picast_${castId++}', VUser(TVOLocalVariable), 0, [], e.pos, expr.t);

                                expr.expr = new HxbTypedExpr(TBlock([
                                    new HxbTypedExpr(TVar(tmp, cst), expr.t, expr.pos),
                                    new HxbTypedExpr(TLocal(tmp), expr.t, e.pos)
                                ]), expr.t, expr.pos).expr;
                            }

                        context.submitNode(expr, true);
                    }

                    case _: return;
                }
            }

            case _: null;
        }
    }

}