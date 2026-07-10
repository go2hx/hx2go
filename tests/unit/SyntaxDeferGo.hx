package unit;


import go.fmt.Fmt;
import go.Syntax;

function main() {
    var x = 10;
    var y = 20;

    Syntax.defer(() -> {
        assert(y == 10);
    });

    Syntax.defer(() -> {
        Fmt.println("deferred result:", x + y);
        y = 10;
    });

    Syntax.code("fmt.Println({0})", "code injection");
}
