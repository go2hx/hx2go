package language;

function run() {
    trace("Local Variables\n");

    var x = 5;
    equals(x, 5);

    var y:Int = 10;
    equals(y, 10);

    final z = 15;
    equals(z, 15);

    var m = 100;
    m = 200;
    equals(m, 200);
}
