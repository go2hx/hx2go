package go.haxe;

import go.Reflect;
import go.reflect.Value;
import go.Syntax;
import go.haxe.HxDynamic;

class HxStringNull {
    public static function isNull(s: String): Bool {
        return Syntax.code("isStringNull({0})", s);
    }

    public static function dynIsStringNull(d: Dynamic): Bool {
        if (Syntax.code("{0} == nil", d)) {
            return false;
        }

        var v: Value = HxDynamic.ensureConcreteValue(d);
        if (!v.isValid() || v.kind() != Reflect.string) {
            return false;
        }

        return Syntax.code("isStringNull({0})", v.string());
    }
}
