package hx2go.util;

import hx2go.hxb.HxbType;
import hx2go.hxb.TypePath;
import hx2go.hxb.Typed.HxbModuleTypeRef;
import hx2go.hxb.HxbModule;
import hx2go.hxb.HxbModuleType;

class TypeHelper {

    public static function follow(context: Context, type: HxbType): HxbType {
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
                TypeHelper.follow(context, p[0]);

            case _: type;
        }
    }

    public static function followToDef(context: Context, type: HxbType): HxbType {
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
                    case MTypedef(info): info.type;
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

            if (aa.name != bb.name) return false;
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

    public static function getTypeOfModule(mod: HxbModuleType, inst: Bool = true): HxbType {
        if (mod == null) {
            return null;
        }

        return switch mod {
            case MClass(x): inst ? TInst(x.path, []) : TClassStatic(x.path);
            case MEnum(x): inst? TEnum(x.path, []) : TEnumStatic(x.path);
            case MAbstract(x): inst ? TAbstract(x.path, []) : TAbstractStatic(x.path);
            case MTypedef(x): TType(x.path, []);
        }
    }

}