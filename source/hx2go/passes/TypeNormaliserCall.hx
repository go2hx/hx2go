package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.hxb.HxbClassField;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Typed.HxbTypedExprDef;

class TypeNormaliserCall extends CompilerPass {

    public static var restId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ t: TFun(params, ret), expr: f }, args): {
                var ext = FieldAccessExtern.getExternInfo(context, new HxbTypedExpr(f, TFun(params, ret), expr.pos));
                var rest = -1;
                var innerType = TVoid;

                for (idx in 0...args.length) {
                    var arg = args[idx];
                    var param  = params[idx] ?? params[params.length - 1];
                    var spread = false;
                    var submit = false;

                    var toType = switch param.t {
                        case TAbstract({ pack: ['haxe'], name: 'Rest' }, params) if (!arg.t.match(TAbstract({ pack: ['haxe'], name: 'Rest' }, _)) || !arg.expr.match(TUnop(OpSpread, _, _))): {
                            rest = rest == -1 ? idx : rest;
                            innerType = params[0];
                            params[0];
                        }

                        case TAbstract({ pack: ['haxe'], name: 'Rest' }, params) if (ext.kind != ExNone): {
                            spread = true;
                            innerType = params[0];
                            param.t;
                        }

                        case _: param.t;
                    };

                    if (!spread && !toType.match(TDynamicAny | TDynamic(_)) && !TypeHelper.compare(arg.t, toType)) {
                        var o = ExprHelper.createCast(arg, toType);
                        arg.expr = o.expr;
                        arg.t = o.t;
                        submit = true;
                    }

                    if (spread) {
                        var inner = switch arg.expr {
                            case TUnop(OpSpread, _, e): e;
                            case _: arg;
                        };
                        // peel every Rest/Dynamic cast to recover the underlying Array<T>
                        while (inner.expr.match(TCast(_, _))
                            && (inner.t == null
                                || inner.t.match(TDynamic(_) | TDynamicAny)
                                || inner.t.match(TAbstract({ pack: ['haxe'], name: 'Rest' }, _)))) {
                            inner = switch inner.expr { case TCast(e, _): e; case _: inner; };
                        }
                        var innerIsDynamic = inner.t == null || inner.t.match(TDynamic(_) | TDynamicAny);
                        arg.expr = ExprHelper.createUntyped("{0}...", [
                            innerIsDynamic ? ExprHelper.createCallStatic(context, { pack: ['go', 'haxe'], name: 'HxDynamic', moduleName: 'HxDynamic' }, 'toAnySlice', [Copy.copy(inner)]) :
                            ExprHelper.createUntyped("(*({0}))", [Copy.copy(inner)])
                        ]).expr;
                        // added to prevent recasting or respreading
                        arg.t = innerType;
                        submit = true;
                    }

                    if (submit) {
                        context.submitNode(arg, true);
                    }
                }

                if (rest != -1 && ext.kind == ExNone) {
                    expr.expr = switch expr.expr {
                        case TCall(f, args): {
                            var slice = ExprHelper.createUntyped('[]${context.getWriter().types.writeHxbType(innerType)}{ ${[for (i in 0...args.length - rest) '{$i}'].join(", ")} }', args.slice(rest));

                            TCall(f, args.slice(0, rest).concat([ slice ]));
                        }

                        case _: expr.expr;
                    }
                }

            };

            case _: null;
        }
    }

}