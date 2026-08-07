package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbFieldAccess;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import haxe.runtime.Copy;
import hxb.flags.HxbClassFieldFlag;
import hxb.flags.HxbClassFlag;
import hx2go.util.TypeHelper;

class FieldAccessGeneric extends CompilerPass {

    public static function processType(t:HxbType):HxbType {
        return switch (t) {
            case TTypeParam(_) | TUnboundTypeParam(_):
                TDynamicAny;

            case TDynamic(t2):
                TDynamic(processType(t2));

            case TFun(args, ret):
                TFun(
                    [for (a in args) {
                        var a2 = Copy.copy(a);
                        a2.t = processType(a.t);
                        a2;
                    }],
                    processType(ret)
                );

            case TInst(c, params):
                TInst(c, [for (p in params) processType(p)]);

            case TEnum(e, params):
                TEnum(e, [for (p in params) processType(p)]);

            case TType(td, params):
                TType(td, [for (p in params) processType(p)]);

            case TAbstract(ab, params):
                TAbstract(ab, [for (p in params) processType(p)]);

            case TAnon(anon):
                var anon2 = Copy.copy(anon);
                anon2.fields = [for (cf in anon.fields) {
                    var cf2 = Copy.copy(cf);
                    cf2.type = processType(cf.type);
                    cf2;
                }];
                anon2.status = switch (anon.status) {
                    case AExtend(types): AExtend([for (x in types) processType(x)]);
                    case s: s;
                };
                TAnon(anon2);

            case _:
                Copy.copy(t);
        }
    }

    static function containsDynamic(t:HxbType):Bool {
        return switch (t) {
            case TDynamicAny | TDynamic(_): true;
            case TFun(args, ret): containsDynamic(ret) || Lambda.exists(args, a -> containsDynamic(a.t));
            case TInst(_, params) | TEnum(_, params) | TType(_, params) | TAbstract(_, params): Lambda.exists(params, containsDynamic);
            case _: false;
        }
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TField(left, FStatic(tp, ref) | FInstance(tp, _, ref) | FClosureInstance(tp, _, ref)): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return;
                }

                switch mt {
                    case MClass(cls): {
                        var fields = cls.fields.concat(cls.statics); // cant use same name for static and instance, so this is ok
                        var field = fields.filter(f -> f.name == ref.name)[0];
                        if (field == null) {
                            return;
                        }

                        if (field.flags & HxbClassFieldFlag.CfExtern != 0 || cls.flags & HxbClassFlag.CExtern != 0) {
                            return;
                        }

                        var erased = processType(field.type);

                        if (containsDynamic(erased) && !containsDynamic(expr.t) && TypeHelper.compare(processType(expr.t), expr.t)) {
                            expr.expr = TCast(new HxbTypedExpr(expr.expr, erased, expr.pos), null);
                            context.submitNode(expr, true, 1);
                            return;
                        }

                        expr.t = erased;
                    }

                    case _: null;
                }
            }

            case _: null;
        }
    }

}