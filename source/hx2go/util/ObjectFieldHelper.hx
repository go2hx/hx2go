package hx2go.util;

import hx2go.hxb.Ast.HxbObjectField;

class ObjectFieldHelper {
    
    public static function readString(field: HxbObjectField): String {
        return switch field.expr?.expr {
            case EConst(CString(x, _)): x;
            case _: "";
        };
    }

    public static function readBool(field: HxbObjectField, defaultValue: Bool = false): Bool {
        return switch field.expr?.expr {
            case EConst(CIdent(x)): x == "true";
            case _: defaultValue;
        }
    }

    public static function readStringList(field: HxbObjectField): Array<String> {
        return switch field.expr?.expr {
            case EArrayDecl(items):
                var out = [];
                for (item in items) {
                    out.push(switch item?.expr {
                        case EConst(CString(x, _)): x;
                        case _: null;
                    });
                }

                out;

            case _: [];
        }
    }

}
