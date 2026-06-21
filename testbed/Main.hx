import go.fmt.Fmt;
import go.Syntax;

class Main {

    public static function say(s: String): Void {
        var say_index = 0;
        while (say_index < 5) {
            Sys.sleep(1);
            Fmt.println(s + ", with index: " + say_index);
            say_index++;
        }
    }

    public static function test(): Void {
        Fmt.println("Test!!", "Cool!!");
    }

    public static function main() {
        Syntax.go(() -> say("world"));
        Syntax.defer(test);

        say("hello");
    }

}