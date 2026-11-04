package haxe;

import go.Syntax;
import go.Map;
import go.Slice;
import go.Strings;
import go.encoding.Json as GoJson;

class Json {

    public static function parse(text:String):Dynamic {
        var decoder = GoJson.newDecoder(Strings.newReader(text));
        decoder.useNumber();

        var raw:Dynamic = null;
        var err = decoder.decode(Syntax.code("&{0}", raw));
        if (err != null) {
            throw "Invalid JSON: " + err.error();
        }

        switch decoder.token() {
            case Ok(_):
                throw "Invalid JSON: unexpected data after top-level value";

            case Err(e):
                if (e.error() != "EOF") {
                    throw "Invalid JSON: " + e.error();
                }
        }

        return convert(raw);
    }

    public static inline function stringify(value:Dynamic, ?replacer:(key:Dynamic, value:Dynamic) -> Dynamic, ?space:String):String {
        return haxe.format.JsonPrinter.print(value, replacer, space);
    }

    static function convert(raw:Dynamic):Dynamic {
        if (Syntax.code("func() bool { _, ok := {0}.(map[string]any); return ok }()", raw)) {
            var obj:Map<String, Dynamic> = Syntax.code("{0}.(map[string]any)", raw);
            for (key in obj.keys()) {
                obj[key] = convert(obj[key]);
            }

            return raw;
        }

        if (Syntax.code("func() bool { _, ok := {0}.([]any); return ok }()", raw)) {
            var items:Slice<Dynamic> = Syntax.code("{0}.([]any)", raw);
            return [for (item in items) convert(item)];
        }

        if (Syntax.code("func() bool { _, ok := {0}.(json.Number); return ok }()", raw)) {
            var text:String = Syntax.code("string({0}.(json.Number))", raw);
            var f = Std.parseFloat(text);
            if (text.indexOf(".") >= 0) {
                return f;
            }

            var i = Std.int(f);
            return i == f ? i : f;
        }

        return raw;
    }

}
