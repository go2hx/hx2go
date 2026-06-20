package hx2go.util;

using StringTools;

import hx2go.hxb.TypePath;
import haxe.macro.Type.ModuleType;
import hx2go.hxb.HxbModuleType;

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

    public static function typePathClassStaticName(tp: TypePath): String {
        return 'Hx_Cls_${tp.dotPath().toLowerCase().replace(".", "_")}';
    }

    public static function typePathClassInstanceName(tp: TypePath): String {
        return 'Hx_Obj_${tp.dotPath().toLowerCase().replace(".", "_")}';
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

    public static function moduleTypeGetTypePath(mt: HxbModuleType): TypePath {
        var p = switch mt {
            case MClass(v): v.path;
            case MEnum(v): v.path;
            case MAbstract(v): v.path;
            case MTypedef(v): v.path;
        };

        return p;
    }

    public static function moduleTypeGetDotPath(mt: HxbModuleType, modulePath: Bool = false): String {
        var p = moduleTypeGetTypePath(mt);
        return modulePath ? p.moduleDotPath() : p.dotPath();
    }

    public static function moduleTypeGetFileName(mt: HxbModuleType): String {
        return 'Hx_${moduleTypeGetTypePath(mt).moduleDotPath().replace(".", "_")}'; // if starting with _ it's ignored
    }

    public static function quoteString(str: String): String {
        return '"' + str.replace('"', '\\"') + '"';
    }

}
