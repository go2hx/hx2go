package language;

function run() {
    trace("Unary Operators\n");
    var x = 5;
    assert(-x, -5);
    assert(!true, false);
    assert(!false, true);
}
