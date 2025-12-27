package language;

function run() {
    trace("Unary Operators\n");
    var x = 5;
    equals(-x, -5);
    equals(!true, false);
    equals(!false, true);
}
