package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hxb.HxbType;
import hxb.HxbClassField;
import haxe.runtime.Copy;
import hxb.Typed.HxbTypedExprDef;
import hxb.Ast.HxbExpr;
import hx2go.passes.FieldAccessExtern.ExternKind;

class TypeNormaliserCall extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall(_) | TNew(_): true;
            case _: false;
        }
    }

    public function norm(ext: { kind: ExternKind, ?options: HxbExpr, ?left: HxbTypedExpr, ?right: String, ?field: HxbClassField }, args: Array<HxbTypedExpr>, params: Array<HxbFunArg>, expr: HxbTypedExpr) {
        var restStart = -1;
        var restElement = TVoid;

        for (idx in 0...args.length) {
            var arg = args[idx];
            var param = params[idx] ?? params[params.length - 1];

            var spread = false;
            var toType = param.t;

            switch param.t {
                case TAbstract({ pack: ['haxe'], name: 'Rest' }, restTypeParams):
                    if (isSpreadOfRest(arg)) {
                        if (ext.kind != ExNone) {
                            spread = true;
                            restElement = restTypeParams[0];
                        }
                    } else {
                        if (restStart == -1) restStart = idx;
                        restElement = restTypeParams[0];
                        toType = restTypeParams[0];
                    }

                case _:
            }

            var changed = false;

            var callee: HxbClassField = ext.field;
            if (param.opt && arg.expr.match(TConst(TNull))
            && !toType.match(TAbstract({ name: "Null", pack: [] }, _))
            && callee != null && callee.expr != null) {
                switch callee.expr.expr.expr {
                    case TFunction(func) if (idx < func.args.length):
                        var defaultValue: HxbTypedExpr = func.args[idx].value;
                        if (defaultValue != null) {
                            var c = ExprHelper.createCast(defaultValue, toType);
                            arg.expr = c.expr;
                            arg.t = c.t;
                            changed = true;
                        }
                    case _:
                }
            }

            if (spread) {
                rewriteSpreadArg(arg, restElement);
                changed = true;
            } else if (needsCast(arg, toType)) {
                var c = ExprHelper.createCast(arg, toType);
                arg.expr = c.expr;
                arg.t = c.t;
                changed = true;
            }

            if (changed) {
                context.submitNode(arg, true);
            }
        }

        if (restStart != -1 && ext.kind == ExNone) {
            collapseRestArgs(expr, restStart, restElement);
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ t: TFun(params, ret), expr: callee }, args):
                norm(
                    FieldAccessExtern.getExternInfo(context, new HxbTypedExpr(callee, TFun(params, ret), expr.pos)),
                    args,
                    params,
                    expr
                );

            case TCall({ expr: TConst(TSuper), t: TInst(tp, _) }, args) | TNew(tp, _, args): {
                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var base = switch m {
                    case MClass(x): x;
                    case _: return;
                }

                if (base.constructor != null) {
                    switch base.constructor.type {
                        case TFun(params, ret): norm({ kind: ExNone, field: base.constructor }, args, params, expr);
                        case _: return;
                    }
                }
            }

            case _: null;
        }
    }

    static function isSpreadOfRest(arg: HxbTypedExpr): Bool {
        return arg.t.match(TAbstract({ pack: ['haxe'], name: 'Rest' }, _))
            && arg.expr.match(TUnop(OpSpread, _, _));
    }

    static function needsCast(arg: HxbTypedExpr, toType: HxbType): Bool {
        return (!toType.match(TDynamicAny | TDynamic(_)) || arg.t.match(TAbstract({ pack: [], name: "Null" }, _)))
            && !TypeHelper.compare(arg.t, toType);
    }

    function rewriteSpreadArg(arg: HxbTypedExpr, elementType: HxbType): Void {
        var inner = switch arg.expr {
            case TUnop(OpSpread, _, e): e;
            case _: arg;
        };

        while (inner.expr.match(TCast(_, _))
            && (inner.t == null
                || inner.t.match(TDynamic(_) | TDynamicAny)
                || inner.t.match(TAbstract({ pack: ['haxe'], name: 'Rest' }, _)))) {
            inner = switch inner.expr {
                case TCast(e, _): e;
                case _: inner;
            };
        }

        var isDynamic = inner.t == null || inner.t.match(TDynamic(_) | TDynamicAny);
        var slice = isDynamic
            ? ExprHelper.createCallStatic(context, { pack: ['go', 'haxe'], name: 'HxDynamic', moduleName: 'HxDynamic' }, 'toAnySlice', [Copy.copy(inner)])
            : ExprHelper.createUntyped("(*({0}))", [Copy.copy(inner)]);

        arg.expr = ExprHelper.createUntyped("{0}...", [slice]).expr;
        arg.t = elementType;
    }

    function collapseRestArgs(expr: HxbTypedExpr, restStart: Int, elementType: HxbType): Void {
        expr.expr = switch expr.expr {
            case TCall(callee, args):
                var goType = context.getWriter().types.writeHxbType(elementType);
                var placeholders = [for (i in 0...args.length - restStart) '{$i}'].join(", ");
                var slice = ExprHelper.createUntyped('[]$goType{ $placeholders }', args.slice(restStart));

                TCall(callee, args.slice(0, restStart).concat([slice]));

            case TNew(tp, params, args):
                var goType = context.getWriter().types.writeHxbType(elementType);
                var placeholders = [for (i in 0...args.length - restStart) '{$i}'].join(", ");
                var slice = ExprHelper.createUntyped('[]$goType{ $placeholders }', args.slice(restStart));

                TNew(tp, params, args.slice(0, restStart).concat([slice]));

            case _:
                expr.expr;
        }
    }

}
