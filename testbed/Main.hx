import go.fmt.Fmt;
import go.Syntax;

class Main {

    public static function main() {
        var x = 10;
        var y = 20;

        Syntax.defer(() -> {
            Fmt.println("result is:");
            Fmt.println(x + y);
        });

        Syntax.code("fmt.Println({0})", "B");
    }

}