package parser.dump;

import haxe.macro.Expr.TypeParamDecl;
import haxe.macro.Expr.MetadataEntry;
import haxe.Json;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr.FieldType;
import haxe.macro.Type.FieldKind;
import haxe.macro.Expr.Field;
import haxe.macro.Expr.TypeDefKind;
import haxe.macro.Expr.TypeDefinition;
import parser.dump.RecordParser;
import HaxeExpr;
/**
 * Where RecordEntry is turned into a HaxeTypeDefinition
 * @param record
 * @return HaxeTypeDefinition
 */
function recordToHaxeTypeDefinition(record: RecordEntry):HaxeTypeDefinition {
    if (record.module == null) {
        trace("cl_module should never be null: " + record.record_debug_path);
        return null;
    }

    var kind:HaxeTypeDefinitionKind = TDClass;
    var fields:Array<HaxeField> = [];
    var isExtern = false;
    switch record.record_kind {
        case RClass:
            var cls = record.toClass();
            isExtern = cls.flags.contains("CExtern");

            if (cls.ordered_fields == null) {
                trace(record.record_debug_path);
            }
            // TODO: temp fix
            if (cls.ordered_fields == null)
                cls.ordered_fields = [];
            for (field in cls.ordered_fields) {
                fields.push(recordClassFieldToHaxeField(record.record_debug_path, field, false));
            }
            // TODO: temp fix
            if (cls.ordered_statics == null)
                cls.ordered_statics = [];
            for (field in cls.ordered_statics) {
                fields.push(recordClassFieldToHaxeField(record.record_debug_path, field, true));
            }

        case RAbstract:
            var abs = record.toAbstract();
            // impl will be a string but the file won't exist if no method wasn't called from it
            // do not force a resolution
            abs.impl;
            //abs.impl[0]

        case RType:
            var t = record.toType();
        case REnum:
            var t = record.toEnum();
        case RUnknown:
            trace('record_kind should not be unknown: ' + record.module + ' in ' + record.record_debug_path);
    }
    return {
        name: record.path,
        module: record.module,
        fields: fields,
        isExtern: isExtern,
        meta: () -> getMeta(record.meta),
        kind: kind,
    };
}

private function getMeta(list:Array<String>):Array<MetadataEntry> {
    return list.map(s -> switch HaxeExprTools.stringToExprDef(s + " _") {
         case EMeta(s, _):
            s;
        default:
            throw "getMeta did not resolve to EMeta";
    });
}

private function recordClassFieldToHaxeField(record_debug_path:String, field:RecordClassField, isStatic:Bool):HaxeField {
    final kind:HaxeFieldKind = switch field.kind {
        case "method", "dynamic method", "inline method":
            final params:Array<TypeParamDecl> = [];
            for (param in field.params) {
                params.push({
                    name: param.get("name"),
                });
            }
            FFun({args: [], params: params});
        case "var":
            FVar;
        case _ if (field.kind == null):
            trace(record_debug_path);
            throw "field.kind is null: " + field.name;
        // property
        case _ if (field.kind.charAt(0) == "(" && field.kind.charAt(field.kind.length - 1) == ")"):
            final args = field.kind.substr(1, field.kind.length - 1).split(",");
            FProp(args[0], args[1]);
        default:
            throw "field.cf_kind unknown: " + field.kind;
    }
    return {
        name: field.name,
        kind: kind,
        t: "#UNKNOWN_TYPE",
        expr: field.expr,
        meta: getMeta(field.meta),
    };
}
