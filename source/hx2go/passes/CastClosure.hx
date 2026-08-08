package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import hxb.Typed.HxbVarKind;
import hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;

class CastClosure extends CompilerPass {

    static var _closureSrcId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch [expr.expr, expr.t] {
            case [
                TCast(e, _),
                TFun(_)
            ]: !isNullConst(e); // a null function stays nil, wrapping it would call nil

            case _: false;
        }
    }

    static function isNullConst(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TConst(TNull): true;
            case TCast(inner, _): isNullConst(inner);
            case TParenthesis(inner): isNullConst(inner);
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        // old[(a, b) -> c] to new[(x, y) -> z]
        /*
        new = func ($1 x, $2 y) z {
            return z(old(a($1), b($2)));
        }
         */

        switch [expr.expr, expr.expr, expr.t] { // get both inner expr ref and type data
            case [TCast({ t: TFun(e_params, e_ret) }, _), TCast(e, _), TFun(params, ret)]: {
                var args: Array<HxbTypedExpr> = [];
                var new_params: Array<HxbVar> = [];

                var name = '_hx_closure_src_${_closureSrcId++}';
                var srcVar = new HxbVar(-1, name, VUser(TVOLocalVariable), 0, [], null, e.t);
                var callee = new HxbTypedExpr(TLocal(srcVar), e.t, null);

                for (i in 0...params.length) {
                    var new_p = params[i];
                    var old_p = e_params[i];
                    new_p.name = (old_p.name == null || old_p.name == "") ? '_hx_carg$i' : old_p.name;

                    var v: HxbVar = new HxbVar(
                        -1,
                        new_p.name,
                        VUser(TVOArgument),
                        0,
                        [],
                        null,
                        new_p.t
                    );

                    new_params.push(v);

                    var e = new HxbTypedExpr(TLocal(v), v.type, null);

                    if (TypeHelper.compare(new_p.t, old_p.t)) args.push(e)
                    else args.push(ExprHelper.createCast(e, old_p.t));

                    context.submitNode(e, true);
                }

                var voidToValue = e_ret.match(TVoid) && !ret.match(TVoid);

                var e_call = new HxbTypedExpr(TCall(callee, args), e_ret, null);
                if (!voidToValue && !TypeHelper.compare(e_ret, ret)) {
                    e_call = new HxbTypedExpr(TCast(e_call, null), ret, null);
                }

                context.submitNode(e_call, true);

                var body: Array<HxbTypedExpr> = if (voidToValue) {
                    [ e_call, new HxbTypedExpr(TReturn(new HxbTypedExpr(TConst(TNull), ret, null)), null, null) ];
                } else if (ret == TVoid) {
                    [ e_call ];
                } else {
                    [ new HxbTypedExpr(TReturn(e_call), null, null) ];
                }

                var closure = new HxbTypedExpr(TFunction({
                    args: new_params.map(v -> {
                        v: v,
                        value: null
                    }),
                    expr: new HxbTypedExpr(TBlock(body), null, null),
                    t: ret,
                }), expr.t, null);

                var decl = new HxbTypedExpr(TVar(srcVar, e), null, null);
                var iife = new HxbTypedExpr(TFunction({
                    args: [],
                    expr: new HxbTypedExpr(TBlock([
                        decl,
                        new HxbTypedExpr(TReturn(closure), null, null)
                    ]), null, null),
                    t: expr.t,
                }), TFun([], expr.t), null);
                expr.expr = TCall(iife, []);
                context.submitNode(decl, true);
            }

            case [TCast({ t: TDynamic(_) | TDynamicAny }, _), TCast(e, _), TFun(params, ret)]: {
                /*
                tmp = dyn
                new = func ($1 x, $2 y) z {
                    return z(HxDynamic.call(tmp, [x, y]))
                }
                */

                var name = '_hx_closure_src_${_closureSrcId++}';
                var srcVar = new HxbVar(-1, name, VUser(TVOLocalVariable), 0, [], null, e.t);
                var srcLocal = new HxbTypedExpr(TLocal(srcVar), e.t, null);

                var new_params: Array<HxbVar> = [];
                var argExprs: Array<HxbTypedExpr> = [];

                for (i in 0...params.length) {
                    var p = params[i];
                    var pname = (p.name == null || p.name == "") ? '_hx_carg$i' : p.name;

                    var v = new HxbVar(-1, pname, VUser(TVOArgument), 0, [], null, p.t);
                    new_params.push(v);

                    var pe = new HxbTypedExpr(TLocal(v), v.type, null);
                    context.submitNode(pe, true);

                    var dynArg = TypeHelper.compare(p.t, TDynamicAny)
                    ? pe
                    : ExprHelper.createCast(pe, TDynamicAny);

                    argExprs.push(dynArg);
                }

                var argsArray = new HxbTypedExpr(TArrayDecl(argExprs), TDynamicAny, null);
                context.submitNode(argsArray, true);

                var dynCall = ExprHelper.createCallStatic(
                    context,
                    {
                        name: 'HxDynamic',
                        moduleName: 'HxDynamic',
                        pack: ['go', 'haxe']
                    },
                    'call',
                    [srcLocal, argsArray]
                );
                context.submitNode(dynCall, true);

                var body: Array<HxbTypedExpr> = if (ret.match(TVoid)) {
                    [ dynCall ];
                } else {
                    var result = TypeHelper.compare(ret, TDynamicAny)
                    ? dynCall
                    : ExprHelper.createCast(dynCall, ret);
                    [ new HxbTypedExpr(TReturn(result), null, null) ];
                }

                var closure = new HxbTypedExpr(TFunction({
                    args: new_params.map(v -> { v: v, value: null }),
                    expr: new HxbTypedExpr(TBlock(body), null, null),
                    t: ret,
                }), expr.t, null);

                var decl = new HxbTypedExpr(TVar(srcVar, e), null, null);
                var iife = new HxbTypedExpr(TFunction({
                    args: [],
                    expr: new HxbTypedExpr(TBlock([
                        decl,
                        new HxbTypedExpr(TReturn(closure), null, null)
                    ]), null, null),
                    t: expr.t,
                }), TFun([], expr.t), null);

                expr.expr = TCall(iife, []);
                context.submitNode(decl, true);
            }

            case _: null;
        }
    }

}