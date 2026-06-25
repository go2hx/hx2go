package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;
import hx2go.hxb.flags.HxbClassFieldFlag;
import hx2go.hxb.flags.HxbClassFlag;

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

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TField(left, FStatic(tp, ref) | FInstance(tp, _, ref)): {
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

                        expr.t = processType(field.type);
                    }

                    case _: null;
                }
            }

            case _: null;
        }
    }

}