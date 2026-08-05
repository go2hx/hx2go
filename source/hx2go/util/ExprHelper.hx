package hx2go.util;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbTypedExprDef;
import haxe.runtime.Copy;
import hxb.HxbType;
import hxb.Typed.HxbModuleTypeRef;
import hxb.TypePath;
import hxb.Typed.HxbFieldAccess;

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

    public static function addExprToBlock(block:HxbTypedExpr, expr:HxbTypedExpr) {
        switch block.expr {
            case TBlock(el):
                el.unshift(expr);
            default:
                throw "not a block";
        }
    }

    public static function debug(e:HxbTypedExpr, find:String):Bool {
        var s = hxb.print.TypedExprPrinter.print(e);
        if (s.indexOf(find) != -1) {
            trace(s);
            trace(e.t);
            return true;
        }else{
            return false;
        }
    }

    public static function isBaseOf(context:Context, key: String, start: TypePath): Bool {
        if (context.resolvedInstanceName(start) == key) {
            return true;
        }

        var cls = switch context.resolve(start) {
            case MClass(x): x;
            case _: return false;
        }

        if (cls.superClass != null && isBaseOf(context, key, cls.superClass.t)) {
            return true;
        }

        for (i in cls.interfaces) {
            if (isBaseOf(context, key, i.t)) {
                return true;
            }
        }

        return false;
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
