package parser.dump;

import haxe.macro.Expr.FieldType;
import haxe.macro.Type.FieldKind;
import haxe.macro.Expr.Field;
import haxe.macro.Expr.TypeDefKind;
import haxe.macro.Expr.TypeDefinition;
import parser.dump.RecordParser;

function run(record:RecordClass):TypeDefinition {
    if (record.cl_module == null) {
        trace("cl_module should never be null: " + record._path);
        return null;
    }
    if (record.cl_kind == null) {
        trace("cl_kind should never be null: " + record._path);
        return null;
    }
    trace(record.cl_module, record.cl_kind);
    var kind:TypeDefKind = TDClass();
    var fields:Array<Field> = [];
    switch record.cl_kind.split(" ")[0] {
        case "KNormal":
            kind = TDClass();
            fields = record.cl_ordered_fields.map(field -> translateField(field, false));
            if (record.cl_ordered_statics != null) {
                fields = fields.concat(record.cl_ordered_statics.map(field -> translateField(field, true)));
            }else{
                
            }
        case "KAbstractImpl":
        default:
            throw "record.cl_kind unknown: " + record.cl_kind;
    }
    return {
        name: record.cl_path,
        pos: null,
        pack: [],
        fields: fields,
        kind: kind,
    };
}

private function translateField(field:RecordClassField, isStatic:Bool):Field {
    final kind:FieldType = switch field.cf_kind {
        case "method":
            FFun({args: [], expr: field.cf_expr});
        case "inline method":
            FFun({args: [], expr: field.cf_expr});
        case "var":
            FVar(null, field.cf_expr);
        // property
        case _ if (field.cf_kind.charAt(0) == "(" && field.cf_kind.charAt(field.cf_kind.length - 1) == ")"):
            final args = field.cf_kind.substr(1, field.cf_kind.length - 1).split(",");
            FProp(args[0], args[1], null, field.cf_expr);
        default:
            throw "field.cf_kind unknown: " + field.cf_kind;
    }
    return {
        name: field.cf_name,
        pos: null,
        access: isStatic ? [AStatic] : [],
        kind: kind,
    };
}