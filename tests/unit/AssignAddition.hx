package unit;

function main() {
    var x:Float = 10;
    var y:Int = foo();
    x = x + y;
    Sys.println(x);
}

function foo() {
    return 11;
}