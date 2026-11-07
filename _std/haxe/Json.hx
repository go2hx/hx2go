package haxe;

import go.Syntax;
import go.Map;
import go.Pointer;
import go.Slice;
import go.Strings;
import go.encoding.Json as GoJson;
import go.encoding.json.Number as JsonNumber;

private enum abstract JsonValueKind(Int) {
    var Other = 0;
    var Object = 1;
    var Array = 2;
    var Number = 3;
}

class Json {

    public static function parse(text:String):Dynamic {
        var decoder = GoJson.newDecoder(Strings.newReader(text));
        decoder.useNumber();

        var raw:Dynamic = null;
        var err = decoder.decode(Pointer.addressOf(raw));
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

    static function kindOf(raw:Dynamic):JsonValueKind {
        return Syntax.code("func() int32 { switch {0}.(type) { case map[string]any: return 1; case []any: return 2; case json.Number: return 3 }; return 0 }()", raw);
    }

    static function convert(raw:Dynamic):Dynamic {
        switch kindOf(raw) {
            case Object:
                var obj:Map<String, Dynamic> = cast raw;
                for (key in obj.keys()) {
                    obj[key] = convert(obj[key]);
                }
                return raw;

            case Array:
                var items:Slice<Dynamic> = cast raw;
                return [for (item in items) convert(item)];

            case Number:
                var number:JsonNumber = cast raw;
                var text:String = cast number;
                var f = Std.parseFloat(text);
                if (text.indexOf(".") >= 0) {
                    return f;
                }

                var i = Std.int(f);
                return i == f ? i : f;

            case Other:
                return raw;
        }
    }

}
