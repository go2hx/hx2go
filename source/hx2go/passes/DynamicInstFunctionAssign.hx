package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;
import hxb.flags.HxbClassFieldFlag;
import hxb.flags.HxbClassFlag;
import hx2go.util.StringConversions;
import hxb.HxbClassField.HxbMethodKind;
import hxb.HxbType.HxbFunArg;
import hxb.Typed.HxbTFunc;
import hxb.Typed.HxbTFuncArg;
import hxb.Typed.HxbVarKind;
import hxb.Typed.HxbVarOrigin;

class DynamicInstFunctionAssign extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign, { expr: TField(_, FInstance(_)), t: TFun(_) }, { t: TFun(_) }): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TBinop(OpAssign, { expr: TField(e, FInstance(tp, params, cf)) }, value): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return;
                }

                var cls = switch mt {
                    case MClass(x): x;
                    case _: return;
                }

                if (cls.flags & HxbClassFlag.CExtern != 0) {
                    return;
                }

                var field = cls.fields.filter(f -> f.name == cf.name && f.kind.match(KMethod(MethDynamic)))[0];
                if (field == null) {
                    return;
                }

                if (field.flags & HxbClassFieldFlag.CfExtern != 0) {
                    return;
                }

                var args = switch field.type {
                    case TFun(args, _): args;
                    case _: return;
                };

                var vcpy = hx2go.normaliser.ExprCopy.copy(value);
                var ret = switch field.type {
                    case TFun(_, ret): ret;
                    case _: return;
                };

                var fun: HxbTFunc = {
                    args: args.map(a -> ({
                        v: {
                            id: -1,
                            name: a.name,
                            type: a.t,
                            kind: VUser(TVOLocalVariable),
                            flags: 0,
                            meta: [],
                            pos: expr.pos,
                            extra: null
                        },
                        value: null
                    } : HxbTFuncArg)),
                    t: ret,
                    expr: null
                };

                vcpy = new HxbTypedExpr(TCall(vcpy, fun.args.map(a -> {
                    new HxbTypedExpr(TLocal(a.v), a.v.type, null);
                })), ret, null);

                if (ret != TVoid) {
                    vcpy = new HxbTypedExpr(TReturn(vcpy), ret, null);
                }

                vcpy = switch vcpy.expr {
                    case TBlock(_): vcpy;
                    case _: new HxbTypedExpr(TBlock([vcpy]), vcpy.t, null);
                }

                fun.expr = vcpy;

                var closure = new HxbTypedExpr(TFunction(fun), TFun(args, fun.t), null);

                value.expr = closure.expr;
                value.t = closure.t;

                context.submitNode(value, true);
            }

            case _: null;
        }
    }

}