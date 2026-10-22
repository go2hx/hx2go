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
import hx2go.normaliser.ExprCopy;

class CastClass extends CompilerPass {

    private static var castId: Int = 0;

    function classType(type:HxbType):HxbType {
        return context.normalize(TypeHelper.follow(context, type, false));
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCast(e, _) if (e.t != null && expr.t != null):
                classType(e.t).match(TInst(_) | TDynamic(_) | TDynamicAny) && classType(expr.t).match(TInst(_));
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch [expr.expr, classType(expr.t)] {
            case [TCast(e, tm), TInst(tp, _)]:
                var sourceType = classType(e.t);
                switch sourceType {
                    case TInst({ name: "Array", pack: [] }, _): {
                        return;
                    }

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

                var pre: HxbTypedExpr = null;
                if (tm != null) {
                    var tmp = new HxbVar(-1, 'hx_cast_ex_${castId++}', VUser(TVOLocalVariable), 0, [], e.pos, e.t);
                    pre = new HxbTypedExpr(TVar(tmp, e), e.t, e.pos);
                    e = new HxbTypedExpr(TLocal(tmp), e.t, e.pos);
                }

                var isDyn = sourceType.match(TDynamic(_) | TDynamicAny | TAbstract({ name: "Any", pack: [] }, _));
                if (isDyn) {
                    var callExpr = ExprHelper.createCallStatic(context, {
                        name: "HxDynamic",
                        moduleName: "HxDynamic",
                        pack: ["go", "haxe"]
                    }, "castClass", [e, new HxbTypedExpr(TConst(TString(StringConversions.typePathClassInstanceName(cls.path))), TString, null)]);

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
                    var srcPath = switch sourceType {
                        case TInst(stp, _): stp;
                        case _: null;
                    }

                    if (cls.flags & HxbClassFlag.CInterface != 0) {
                        var vtableName = StringConversions.typePathClassVTableName(cls.path);
                        var castHelper = StringConversions.typePathStaticFieldName("castClass", { name: "HxDynamic", moduleName: "HxDynamic", pack: ["go", "haxe"] });
                        var src = '_hx_icast_${castId++}';
                        expr.expr = ExprHelper.createUntyped(
                            '(func() *$name { $src := {0}; if $src == nil { return nil }; $castHelper($src, "$name"); return &$name{ VTable: $src.VTable.($vtableName) } })()',
                            [e]).expr;
                    } else if (srcPath != null && ExprHelper.isBaseOf(context, context.resolvedInstanceName(cls.path), srcPath)) {
                        expr.expr = ExprHelper.createUntyped(
                            '(func() *$name { _hx_up := {0}; if _hx_up != nil { return &_hx_up.$name }; return nil })()',
                            [e]).expr;
                    } else {
                        expr.expr = ExprHelper.createUntyped('{0}.VTable.(*$name)', [e]).expr;
                    }
                }

                // check validity check, see: https://github.com/go2hx/hx2go/issues/198
                if (tm != null) {
                    expr.expr = new HxbTypedExpr(
                    TBlock([
                        pre,
                        new HxbTypedExpr(TIf(
                            new HxbTypedExpr(
                            TUnop(
                                OpNot,
                                false,
                                ExprHelper.createCallStatic(context, { name: "Std", moduleName: "Std", pack: [] }, "isOfType", [
                                    ExprCopy.copy(e),
                                    new HxbTypedExpr(TTypeExpr(MTClass(tp)), TDynamicAny, null)
                                ])
                            ),
                            TBool, expr.pos
                            ),
                            new HxbTypedExpr(
                            TThrow(
                                new HxbTypedExpr(TConst(TString("Class cast error")), TString, expr.pos)
                            ),
                            TVoid, expr.pos
                            ),
                            null
                        ), TVoid, expr.pos),
                        ExprCopy.copy(expr)
                    ]), expr.t, expr.pos
                    ).expr;

                    context.submitNode(expr, true, 1);
                }

            case _: null;
        }
    }

}