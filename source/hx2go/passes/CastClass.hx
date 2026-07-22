package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;
import hx2go.normaliser.Semantics;
import hx2go.util.StringConversions;
import hx2go.hxb.flags.HxbClassFlag;
import hx2go.hxb.TypePath;

class CastClass extends CompilerPass {

    private static var dynCastId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TInst(_) | TDynamic(_) | TDynamicAny }, _), t: TInst(_) }: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr {
            case { expr: TCast(e, _), t: TInst(tp, _) }:
                switch e.t {
                    case TInst(ftp, _) if (ftp.dotPath() == tp.dotPath()): {
                        expr.expr = e.expr;
                        return;
                    }

                    case _: null;
                }

                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var cls = switch m {
                    case MClass(x): x;
                    case _: return;
                }

                if (cls.flags & HxbClassFlag.CExtern != 0) {
                    return;
                }

                var isDyn = e.t.match(TDynamic(_) | TDynamicAny);
                if (isDyn) {
                    var callExpr = ExprHelper.createCallStatic(context, {
                        name: "HxDynamic",
                        moduleName: "HxDynamic",
                        pack: ["go", "haxe"]
                    }, "toClass", [e, new HxbTypedExpr(TConst(TString(StringConversions.typePathClassInstanceName(cls.path))), TString, null)]);

                    var name = StringConversions.typePathClassInstanceName(cls.path);
                    var tmp = new HxbVar(-1, 'hx_dyncast_${dynCastId++}', VUser(TVOLocalVariable), 0, [], e.pos, callExpr.t);
                    var tmp_local = new HxbTypedExpr(TLocal(tmp), callExpr.t, e.pos);

                    var castedVal = ExprHelper.createUntyped('{0}.(*$name)', [tmp_local]);
                    castedVal.t = expr.t;

                    var o = new HxbTypedExpr(TBlock([
                        new HxbTypedExpr(TVar(tmp, callExpr), callExpr.t, expr.pos),
                        new HxbTypedExpr(
                        TIf(
                            ExprHelper.createUntyped('{0} != nil', [tmp_local]),
                            castedVal,
                            new HxbTypedExpr(TConst(TNull), expr.t, expr.pos)
                        ),
                        expr.t,
                        expr.pos
                        )
                    ]), expr.t, expr.pos);

                    expr.expr = o.expr;
                    context.submitNode(expr, true, 1);
                } else {
                    var name = StringConversions.typePathClassInstanceName(cls.path);
                    var srcPath = switch e.t {
                        case TInst(stp, _): stp;
                        case _: null;
                    }

                    if (srcPath != null && isBaseOf(context.resolvedInstanceName(cls.path), srcPath)) {
                        expr.expr = ExprHelper.createUntyped('&{0}.$name', [e]).expr;
                    } else {
                        expr.expr = ExprHelper.createUntyped('{0}.VTable.(*$name)', [e]).expr;
                    }
                }

            case _: null;
        }
    }

    function isBaseOf(key: String, start: TypePath): Bool {
        if (context.resolvedInstanceName(start) == key) {
            return true;
        }

        var cls = switch context.resolve(start) {
            case MClass(x): x;
            case _: return false;
        }

        if (cls.superClass != null && isBaseOf(key, cls.superClass.t)) {
            return true;
        }

        for (i in cls.interfaces) {
            if (isBaseOf(key, i.t)) {
                return true;
            }
        }

        return false;
    }

}
