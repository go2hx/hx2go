package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbFieldAccess;
import hxb.Typed.HxbVar;
import hxb.Typed.HxbVarKind;
import hxb.Typed.HxbVarOrigin;
import hxb.flags.HxbClassFlag;
import hxb.HxbType;

class FieldAccessArrayClosure extends CompilerPass {

    static var _closureId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FClosureInstance(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TField(e, FClosureInstance(tp, params, cf)): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return;
                }

                var cls = switch mt {
                    case MClass(x): x;
                    case _: return;
                }

                if (cls.flags & HxbClassFlag.CExtern == 0) {
                    return;
                }

                if (cls.fields.filter(f -> f.name == cf.name)[0] == null) {
                    return;
                }

                var funType = expr.t;
                var sig = switch funType {
                    case TFun(args, ret): { args: args, ret: ret };
                    case _: return;
                }

                var srcVar = new HxbVar(-1, '_hx_arr_recv_${_closureId++}', VUser(TVOLocalVariable), 0, [], null, e.t);
                var srcLocal = new HxbTypedExpr(TLocal(srcVar), e.t, null);

                var argVars: Array<HxbVar> = [];
                var argLocals: Array<HxbTypedExpr> = [];
                for (i in 0...sig.args.length) {
                    var a = sig.args[i];
                    var pname = (a.name == null || a.name == "") ? '_hx_carg$i' : a.name;
                    var v = new HxbVar(-1, pname, VUser(TVOArgument), 0, [], null, a.t);
                    argVars.push(v);
                    argLocals.push(new HxbTypedExpr(TLocal(v), a.t, null));
                }

                var innerCall = new HxbTypedExpr(TCall(new HxbTypedExpr(TField(srcLocal, FClosureInstance(tp, params, cf)), funType, null), argLocals), sig.ret, null);

                var body: Array<HxbTypedExpr> = sig.ret.match(TVoid)
                    ? [ innerCall ]
                    : [ new HxbTypedExpr(TReturn(innerCall), null, null) ];

                var closure = new HxbTypedExpr(TFunction({
                    args: argVars.map(v -> { v: v, value: null }),
                    expr: new HxbTypedExpr(TBlock(body), null, null),
                    t: sig.ret,
                }), funType, null);

                var decl = new HxbTypedExpr(TVar(srcVar, e), null, null);
                var iife = new HxbTypedExpr(TFunction({
                    args: [],
                    expr: new HxbTypedExpr(TBlock([
                        decl,
                        new HxbTypedExpr(TReturn(closure), null, null)
                    ]), null, null),
                    t: funType,
                }), TFun([], funType), null);

                expr.expr = TCall(iife, []);

                // let FieldAccessArray rewrite the forwarded call
                context.submitNode(innerCall);
            }

            case _: null;
        }
    }

}
