package language;

function run() {
    trace("Conditionals\n");

    var r1 = 0;
    if (10 > 5) r1 = 1; else r1 = 2;
    assert(r1, 1);

    var r2 = 0;
    if (true) r2 = 1;
    assert(r2, 1);

    var x = 10;
    var r3 = 0;
    if (x < 5) r3 = 1;
    else if (x < 15) r3 = 2;
    else r3 = 3;
    assert(r3, 2);

    var r4 = 0;
    if (5 < 10 && 10 > 0) r4 = 1;
    assert(r4, 1);
}
