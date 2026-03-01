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
import haxe.macro.Expr.ComplexType;

using StringTools;

/**
 * Where RecordEntry is turned into a HaxeTypeDefinition
 * @param record
 * @return HaxeTypeDefinition
 */
function recordToHaxeTypeDefinition(record: RecordEntry):HaxeTypeDefinition {
    if (record.module == null) {
        Logging.recordParser.error("cl_module should never be null: " + record.record_debug_path);
        return null;
    }

    var kind:HaxeTypeDefinitionKind = TDClass;
    var fields:Array<HaxeField> = [];
    var params:Array<TypeParamDecl> = [];
    var isExtern = false;

    switch record.record_kind {
        case RClass:
            var cls = record.toClass();
            isExtern = cls.flags.contains("CExtern");

            if (cls.ordered_fields == null) {
                Logging.recordParser.warn('no ordered fields for: ${record.record_debug_path}');
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

            if (cls.params == null)
                cls.params = [];

            for (param in cls.params) {
                params.push(recordTypeParamToParamDecl(record.record_debug_path, param));
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
            Logging.recordParser.warn('record_kind should not be unknown: ' + record.module + ' in ' + record.record_debug_path);
    }

    var constructor: HaxeField = null;
    var superClass: String = null;

    if (record.record_kind == RClass && record.toClass().constructor != null) {
        var cls = record.toClass();
        var c = cls.constructor;
        var params: Array<TypeParamDecl> = [];

        // interp doesn't like the mapping of the constructor, so doing it like this...
        for (p in ( c.get("cf_params") : Array<Dynamic> )) {
            params.push({ name: p.cf_name });
        }

        constructor = {
            name: c.get("cf_name"),
            kind: FFun({ args: [], params: params }),
            t: "#UNKNOWN_TYPE",
            pos: null,
            expr: c.get("cf_expr"),
            meta: getMeta(c.get("cf_meta")),
            isStatic: true
        };
    }

    if (record.record_kind == RClass) {
        var cls = record.toClass();
        if (cls._super != null && cls._super != "None") {
            superClass = cls._super;
        }
    }

    return {
        name: record.path,
        module: record.module,
        fields: fields,
        isExtern: isExtern,
        meta: () -> getMeta(record.meta),
        constructor: constructor,
        kind: kind,
        superClass: superClass,
        params: params
    };
}

private function getMeta(list:Array<String>):Array<MetadataEntry> {
    return list.map(s -> switch @:privateAccess HaxeExprTools.stringToExprDef(s + " _") {
         case EMeta(s, _):
            s;
        default:
            throw "getMeta did not resolve to EMeta";
    });
}

private function recordTypeParamToParamDecl(record_debug_path:String, param: Map<String, Dynamic>): TypeParamDecl {
    return {
        name: param["name"],
    };
}

function parseAstType(t: String): String {
    var parseList: String->Array<String> = (s) -> {
        if (s == null) {
            return [];
        }

        s = s.substr(1, s.length - 1);

        var result = [];
        var buffer = "";
        var depth = 0;

        for (idx in 0...s.length) {
            var char = s.charAt(idx);

            buffer += char;
            switch char {
                case '[' | '(': depth++;
                case ']' | ')': depth--;
                case ',' if (depth == 0):
                    result.push(buffer.substr(0, buffer.length - 1).trim());
                    buffer = "";
                    continue;
            }
        }

        if (buffer.endsWith("]")) {
            buffer = buffer.substr(0, buffer.length - 1);
        }

        if (buffer.trim() != "") {
            result.push(buffer.trim());
        }

        return result;
    };

    var parseInner: String->String;
    parseInner = (inner) -> {
        if (inner == null) {
            return "#INVALID_AST_TYPE";
        }

        var parts = inner.split(" ").join("").split("(");
        var name = parts[0];
        var inner = parts.slice(1).join("(");
        inner = "[" + inner.substr(0, inner.length - 1) + "]";

        var elements = parseList(inner);

        return switch (name) {
            case "TInst" | "TAbstract" | "TEnum" | "TType":
                var params = parseList(elements[1]);
                '${elements[0]}${params.length > 0 ? "<" + params.map(q -> parseInner(q)).join(", ") + ">" : ""}';

            case "TMono" | "Some":
                parseInner(elements[0]);

            case "TFun":
                var args = parseList(elements[0]);
                var ret = parseInner(elements[1]);
                var argStr = 'Void';

                if (args.length > 0) {
                    argStr = '(' + args.map(q -> {
                        var parts = q.split(":");
                        var name = parts.shift();
                        var type = parseInner(parts.join(":"));

                        return type;
                    }).join(", ") + ')';
                }

                '$argStr->$ret';

            case "TDynamic" | "TAnon": // mikaib: i think TAnon is OK like this?
                "Dynamic";

            case "TLazy":
                Logging.recordParser.warn('TLazy in field type, inside of ast type: "$t"');
                "Dynamic";

            case _:
                Logging.recordParser.warn('unable to parse ast type: "$t" with name "$name"');
                '#UNKNOWN_AST_TYPE';
        }
    }

    return parseInner(t);
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
            Logging.recordParser.error('null kind: $record_debug_path');
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
        t: parseAstType(field.type),
        expr: field.expr,
        meta: getMeta(field.meta),
        isStatic: isStatic,
        pos: field.pos
    };
}
