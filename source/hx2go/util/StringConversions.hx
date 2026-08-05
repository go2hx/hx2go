package hx2go.util;

using StringTools;

import hxb.TypePath;
import haxe.macro.Type.ModuleType;
import hxb.HxbModuleType;

class StringConversions {

    public static function toPascalCase(input: String): String {
        return input.charAt(0).toUpperCase() + input.substr(1);
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

    public static function typePathStaticFieldName(fieldName: String, tp: TypePath): String {
        return 'Hx_Field_${tp.dotPath().toLowerCase().replace(".", "_")}_${fieldName}';
    }

    public static function typePathClassStaticName(tp: TypePath): String {
        return 'Hx_Cls_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function typePathClassInstanceName(tp: TypePath): String {
        return 'Hx_Obj_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function typePathClassVTableName(tp: TypePath): String {
        return 'Hx_Obj_VTable_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function typePathTypedefName(tp: TypePath): String {
        return 'Hx_Typedef_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function typePathEnumName(tp: TypePath): String {
        return 'Hx_Enum_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function typePathAbstractName(tp: TypePath): String {
        return 'Hx_Abstract_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function nameToFieldName(name: String): String {
        return 'Hx_Field_${name}';
    }

    public static function moduleTypeGetTypePath(mt: HxbModuleType): TypePath {
        var p = switch mt {
            case MClass(v): v.path;
            case MEnum(v): v.path;
            case MAbstract(v): v.path;
            case MTypedef(v): v.path;
        };

        return p;
    }

    public static function stringPathGetFileName(sp: String): String {
        return 'Hx_${sp.replace(".", "_")}'; // if starting with _ it's ignored
    }

    public static function quoteString(str: String): String {
        var buf = new StringBuf();
        buf.add('"');

        for (i in 0...str.length) {
            var c = StringTools.fastCodeAt(str, i);
            switch (c) {
                case '\\'.code: buf.add("\\\\");
                case '"'.code: buf.add('\\"');
                case '\n'.code: buf.add("\\n");
                case '\r'.code: buf.add("\\r");
                case '\t'.code: buf.add("\\t");
                default:
                    if (c < 0x20 || c == 0x7f) {
                        buf.add("\\x");
                        buf.add(StringTools.hex(c, 2));
                    } else {
                        buf.addChar(c);
                    }
            }
        }

        buf.add('"');

        return buf.toString();
    }

}
