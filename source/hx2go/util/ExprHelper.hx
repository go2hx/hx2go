package hx2go.util;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef;
import haxe.runtime.Copy;
import hx2go.hxb.HxbType;
import hx2go.hxb.Typed.HxbModuleTypeRef;
import hx2go.hxb.TypePath;
import hx2go.hxb.Typed.HxbFieldAccess;

class ExprHelper {

    public static function unwrapNullableLocal(arr: HxbTypedExpr): Void {
        switch arr.expr {
            case TLocal(v) if (v.type != null && v.type.match(TAbstract({ name: 'Null', pack: [] }, _))):
                var local = Copy.copy(arr);
                arr.expr = ExprHelper.createUntyped('{0}.Value', [local]).expr;
            case _:
        }
    }

    public static function createUntyped(template: String, params: Array<HxbTypedExpr>): HxbTypedExpr {
        return new HxbTypedExpr(
            TCall(
                new HxbTypedExpr(TIdent("__go__"), TVoid, null),
                [
                    new HxbTypedExpr(TConst(TString(template)), TString, null)
                ].concat(params)
            ),
            null, null
        );
    }

    public static function createCast(expr: HxbTypedExpr, type: HxbType): HxbTypedExpr {
        return new HxbTypedExpr(
            TCast(Copy.copy(expr), null),
            type,
            null
        );
    }

    public static function createCallStatic(context: Context, type: TypePath, typeField: String, params: Array<HxbTypedExpr>): HxbTypedExpr {
        var mod = context.resolve(type);
        if (mod == null) {
            throw 'could not resolve static call on $type as module was not found';
        }

        var field = switch mod {
            case MClass(cls): cls.statics.filter(f -> f.name == typeField)[0];
            case MAbstract(a): return createCallStatic(context, a.impl, typeField, params);
            case _:
                throw 'static call on unsupported module type $mod';
        }

        if (field == null) {
            throw 'field $typeField not found on $mod';
        }

        var fun = switch field.type {
            case TFun(params, ret): { params: params, ret: ret };
            case _: throw '$field on $mod is not a function';
        }

        return new HxbTypedExpr(
            TCall(new HxbTypedExpr(
                TField(
                    new HxbTypedExpr(
                        TTypeExpr(MTClass(type)),
                        null,
                        null
                    ),
                    FStatic(type, { owner: type, name: typeField, kind: FRStatic, depth: 0 })
                ),
                field.type,
                null
            ), params),
            fun.ret,
            null
        );
    }

}
