import haxe.Json;
import haxe.CallStack;
import parser.dump.ExprParser.Object;

class Util {
    public static function normalizeCLRF(text:String):String {
        text = StringTools.replace(text, "\r\n", "\n");
        text = StringTools.replace(text, "\r", "\n");
        return text;
    }

    public static function backtrace(message: String, ?module: Module, ?object: Object, ?expr: HaxeExpr, ?path: String) {
        // module unused for now
        Sys.println("");
        Sys.println("Fatal error: " + message);

        if (path != null) {
            Sys.println("In: " + path);
        }

        if (object != null) {
            Sys.println("Attached Object: " + Json.stringify(object, null, ' '));
        }

        if (expr != null) {
            Sys.println("Attached Expression: " + Json.stringify(object, null, ' '));
        }

        Sys.println("");
        Sys.println("We kindly ask you to report the issue over on our github:");
        if (path != null) {
            Sys.println("If possible, upload and send: " + path);
        }
        Sys.println("https://github.com/go2hx/hx2go/issues");

        Sys.println("");

        Sys.println('---------- CALLSTACK ----------');
        for (cti in CallStack.callStack()) {
            Sys.println(Std.string(cti));
        }

        Sys.exit(1);
    }
}
