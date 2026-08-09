package hx2go.util;

import hxb.HxbType;
import hxb.TypePath;
import hxb.Typed.HxbModuleTypeRef;
import hxb.Typed.HxbTypedExpr;
import hxb.HxbModule;
import hxb.HxbModuleType;
import haxe.runtime.Copy;

class TypeHelper {

    public static function goEraseType(t: HxbType): HxbType {
        return switch (t) {
            case TTypeParam(_) | TUnboundTypeParam(_):
                TDynamicAny;

            case TDynamic(t2):
                TDynamic(goEraseType(t2));

            case TFun(args, ret):
                TFun(
                    [for (a in args) {
                        var a2 = Copy.copy(a);
                        a2.t = goEraseType(a.t);
                        a2;
                    }],
                    goEraseType(ret)
                );

            case TInst(c, params):
                TInst(c, [for (p in params) goEraseType(p)]);

            case TEnum(e, params):
                TEnum(e, [for (p in params) goEraseType(p)]);

            case TType(td, params):
                TType(td, [for (p in params) goEraseType(p)]);

            case TAbstract(ab, params):
                TAbstract(ab, [for (p in params) goEraseType(p)]);

            case TAnon(anon):
                var anon2 = Copy.copy(anon);
                anon2.fields = [for (cf in anon.fields) {
                    var cf2 = Copy.copy(cf);
                    cf2.type = goEraseType(cf.type);
                    cf2;
                }];
                anon2.status = switch (anon.status) {
                    case AExtend(types): AExtend([for (x in types) goEraseType(x)]);
                    case s: s;
                };
                TAnon(anon2);

            case _:
                Copy.copy(t);
        }
    }

    public static function reconcile(wanted: HxbType, valueExpr: HxbTypedExpr, emitted: HxbType): Null<HxbTypedExpr> {
        if (!needsExplicitCast(emitted, wanted)) {
            return null;
        }

        var inner = Copy.copy(valueExpr);
        inner.t = goEraseType(emitted);
        return new HxbTypedExpr(TCast(inner, null), wanted, valueExpr.pos);
    }

    static function needsExplicitCast(emitted: HxbType, wanted: HxbType): Bool {
        if (emitted == null || wanted == null) {
            return false;
        }

        var emittedGo = goEraseType(emitted);
        var wantedGo = goEraseType(wanted);
        if (compare(emittedGo, wantedGo)) {
            return false;
        }

        var assertFromAny = emittedGo.match(TDynamicAny | TDynamic(_)) && !wantedGo.match(TDynamicAny | TDynamic(_));
        var adaptClosure = emittedGo.match(TFun(_)) && wantedGo.match(TFun(_));
        return assertFromAny || adaptClosure;
    }

    public static function follow(context: Context, type: HxbType, getNullElem:Bool=true): HxbType {
        if (type == null) {
            return null;
        }

        return switch type {
            case TType(tp, _): {
                var mod = context.resolve(tp);
                if (mod == null) {
                    return type;
                }

                switch mod {
                    case MTypedef(info): TypeHelper.follow(context, info.type);
                    case _: type;
                }
            }

            case TAbstract({ name: "Null", pack: [] }, p):
                if (getNullElem) {
                    TypeHelper.follow(context, p[0]);
                }else{
                    type;
                }

            case _: type;
        }
    }

    public static function followToDef(context: Context, type: HxbType, supportsExtern: Bool = false): HxbType {
        if (type == null) {
            return null;
        }

        return switch type {
            case TType(tp, _): {
                var mod = context.resolve(tp);
                if (mod == null) {
                    return type;
                }

                switch mod {
                    case MTypedef(info): {
                        var m = info.meta.filter(m -> m.name == ":go.Type")[0];
                        if (m != null && supportsExtern){
                            return TInst(info.path, []);
                        }

                        return info.type;
                    }

                    case _: type;
                }
            }

            case _: type;
        }
    }

    public static function compare(a: HxbType, b: HxbType): Bool {
        if (a == null || b == null) {
            return false;
        }

        return switch [a, b] {
            case [TMono(i1), TMono(i2)]:
                i1 == i2;

            case [TTypeParam(s1, i1), TTypeParam(s2, i2)]:
                s1 == s2 && i1 == i2;

            case [TUnboundTypeParam(p1), TUnboundTypeParam(p2)]:
                comparePath(p1, p2);

            case [TDynamicAny, TDynamicAny]:
                true;

            case [TDynamic(t1), TDynamic(t2)]:
                compare(t1, t2);

            case [TClassStatic(c1), TClassStatic(c2)]:
                comparePath(c1, c2);

            case [TEnumStatic(e1), TEnumStatic(e2)]:
                comparePath(e1, e2);

            case [TAbstractStatic(a1), TAbstractStatic(a2)]:
                comparePath(a1, a2);

            case [TExprType(e1), TExprType(e2)]:
                e1 == e2; // TODO: deep equal

            case [TFun(args1, ret1), TFun(args2, ret2)]:
                compareFunArgs(args1, args2) && compare(ret1, ret2);

            case [TInst(c1, p1), TInst(c2, p2)]:
                comparePath(c1, c2) && compareTypes(p1, p2);

            case [TEnum(e1, p1), TEnum(e2, p2)]:
                comparePath(e1, e2) && compareTypes(p1, p2);

            case [TType(t1, p1), TType(t2, p2)]:
                comparePath(t1, t2) && compareTypes(p1, p2);

            case [TAbstract(a1, p1), TAbstract(a2, p2)]:
                comparePath(a1, a2) && compareTypes(p1, p2);

            case [TAnon(a1), TAnon(a2)]:
                compareAnon(a1, a2);

            case [TVoid, TVoid]
            | [TInt, TInt]
            | [TFloat, TFloat]
            | [TBool, TBool]
            | [TString, TString]:
                true;

            case _:
                false;
        };
    }

    public static function comparePath(a: TypePath, b: TypePath): Bool {
        if (a.name != b.name) return false;
        if (a.moduleName != b.moduleName) return false;
        if (a.pack.length != b.pack.length) return false;

        for (i in 0...a.pack.length) {
            if (a.pack[i] != b.pack[i]) return false;
        }

        return true;
    }

    public static function compareTypes(a: Array<HxbType>, b: Array<HxbType>): Bool {
        if (a.length != b.length) return false;

        for (i in 0...a.length) {
            if (!compare(a[i], b[i])) return false;
        }

        return true;
    }

    public static function compareFunArgs(a: Array<HxbFunArg>, b: Array<HxbFunArg>): Bool {
        if (a.length != b.length) return false;

        for (i in 0...a.length) {
            final aa = a[i];
            final bb = b[i];

            if (aa.opt != bb.opt) return false;
            if (!compare(aa.t, bb.t)) return false;
        }

        return true;
    }

    static function compareAnon(a: HxbAnon, b: HxbAnon): Bool {
        return a == b; // TODO: deep equal
    }

    public static function pathOfModuleTypeRef(mt: HxbModuleTypeRef): TypePath {
        if (mt == null) {
            return null;
        }

        return switch mt {
            case MTClass(x) | MTAbstract(x) | MTTypedef(x) | MTEnum(x) | MTUnknown(x): x;
        }
    }

    public static function getTypeOfModule(mod: HxbModuleType, ?instOpt: Bool): HxbType {
        if (mod == null) {
            return null;
        }
        // TODO use instOpt as an arg with a default value, once it's supported
        var inst = instOpt ?? true;
        return switch mod {
            case MClass(x): inst ? TInst(x.path, []) : TClassStatic(x.path);
            case MEnum(x): inst? TEnum(x.path, []) : TEnumStatic(x.path);
            case MAbstract(x): inst ? TAbstract(x.path, []) : TAbstractStatic(x.path);
            case MTypedef(x): TType(x.path, []);
        }
    }

}