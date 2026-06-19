import go.fmt.Fmt;
import go.Syntax;

class Main {

    public static function say(s: String): Void {
        var i = 0;
        while (i < 5) {
            Sys.sleep(1);
            Fmt.println(s + ", with index: " + i);
            i++;
        }
    }

    public static function test(): Void {
        Fmt.println("Test!!");
    }

    public static function main() {
        Syntax.go(() -> say("world"));
        Syntax.defer(test);

        say("hello");
    }

}