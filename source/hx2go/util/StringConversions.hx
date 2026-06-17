package hx2go.util;

using StringTools;

import hx2go.hxb.TypePath;

class StringConversions {

    public static function toPascalCase(input: String): String {
        return input.charAt(0).toUpperCase() + input.substr(1).toLowerCase();
    }

    public static function pathToLossyTypePath(path: String): TypePath {
        var parts = path.split(".");
        var name = parts.pop();

        return {
            name: name,
            moduleName: name,
            pack: parts
        };
    }

    public static function typePathFieldName(fieldName: String, tp: TypePath): String {
        return 'Hx_Field_${tp.dotPath().toLowerCase().replace(".", "_")}_${fieldName}';
    }

    public static function typePathInstanceName(tp: TypePath): String {
        return 'Hx_Obj_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function typePathClassName(tp: TypePath): String {
        return 'Hx_Cls_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function quoteString(str: String): String {
        return '"' + str.replace('"', '\\"') + '"';
    }

}
