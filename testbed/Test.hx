@:analyzer(ignore)
function main() {
    var x: Null<Int> = null;
    Sys.println(x);

    x = 3;
    Sys.println(x); 
    if (x == null) {
        Sys.println('x is null!');
    }

    if (x == 0) {
        Sys.println('x is zero!');
    }

    x = 0;
    Sys.println(x);
    if (x == null) {
        Sys.println('x is null!');
    }

    if (x == 0) {
        Sys.println('x is zero!');
    }

    x = null;
    Sys.println(x);
    if (x == null) {
        Sys.println('x is null!');
    }

    if (x == 0) {
        Sys.println('x is zero!');
    }

    x = 3;

    var y: Int = x;
    Sys.println(y);

    y = 3;
    Sys.println(y);

    y = x; 
    Sys.println(y);

    if (y == 0) {
        Sys.println('y is zero!');
    }

    trace("Heya!");

    // TODO: field access on Nullable
    // TODO: array access on Nullable (x[NULL] and NULL[x])
    // TODO: dynamic on null
    // TODO: binop / unop on nullable
    // TODO: Null<Null<T>> (nested nullable)
}