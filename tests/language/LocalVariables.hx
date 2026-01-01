package language;

function run() {
    trace("Local Variables\n");

    var x = 5;
    assert(x, 5);

    var y:Int = 10;
    assert(y, 10);

    final z = 15;
    assert(z, 15);

    var m = 100;
    m = 200;
    assert(m, 200);
}
