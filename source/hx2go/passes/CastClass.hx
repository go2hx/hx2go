package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import hxb.Typed.HxbVarKind;
import hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;
import hx2go.normaliser.Semantics;
import hx2go.util.StringConversions;
import hxb.flags.HxbClassFlag;
import hxb.TypePath;

class CastClass extends CompilerPass {

    private static var castId: Int = 0;

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
                        expr.t = e.t;
                        context.submitNode(expr, true);

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
                    var tmp = new HxbVar(-1, 'hx_dyncast_${castId++}', VUser(TVOLocalVariable), 0, [], e.pos, callExpr.t);
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

//                    if (cls.flags & HxbClassFlag.CInterface != 0) {
//                        expr.expr = ExprHelper.createUntyped('&{0}.$name', [e]).expr;
//                    } else if (srcPath != null && isBaseOf(context.resolvedInstanceName(cls.path), srcPath)) {
//                        expr.expr = ExprHelper.createUntyped('&{0}.$name', [e]).expr;
//                    } else {
//                        expr.expr = ExprHelper.createUntyped('{0}.(*$name)', [e]).expr;
//                    }

                    if (cls.flags & HxbClassFlag.CInterface != 0) {
                        var cst = ExprHelper.createUntyped('&$name{ VTable: {0}.VTable.(${StringConversions.typePathClassVTableName(cls.path)}) }', [e]);
                        var tmp = new HxbVar(-1, 'hx_icast_${castId++}', VUser(TVOLocalVariable), 0, [], e.pos, expr.t);

                        expr.expr = new HxbTypedExpr(TBlock([
                            new HxbTypedExpr(TVar(tmp, cst), expr.t, expr.pos),
                            new HxbTypedExpr(TLocal(tmp), expr.t, e.pos)
                        ]), expr.t, expr.pos).expr;

                    } else if (srcPath != null && ExprHelper.isBaseOf(context, context.resolvedInstanceName(cls.path), srcPath)) {
                        expr.expr = ExprHelper.createUntyped('&{0}.$name', [e]).expr;
                    } else {
                        expr.expr = ExprHelper.createUntyped('{0}.VTable.(*$name)', [e]).expr;
                    }
                }

            case _: null;
        }
    }

}
