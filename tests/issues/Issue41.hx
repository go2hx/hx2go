package issues;

function run() {
    var a: go.Int32 = -16;
    var b: go.Int32 = 3;
    assert(a >>> b, 536870910); // 536870910
    assert(a >> b, -2);  // -2

    var x: go.UInt32 = 16;
    var y: go.UInt32 = 3;
    assert(x >>> y, 2); // 2
    assert(x >> y, 2);  // 2

    assert(a >> x, -1);  // -1
    assert(a >>> x, 65535); // 65535
    assert(a >> y, -2);  // -2
    assert(a >>> y, 536870910); // 536870910
    assert(b >> x, 0);  // 0
    assert(b >>> x, 0); // 0
    assert(b >> y, 0);  // 0
    assert(b >>> y, 0); // 0
    assert(x >> a, 0);  // 0
    assert(x >>> a, 0); // 0
    assert(x >> b, 2);  // 2
    assert(x >>> b, 2); // 2
    assert(y >> a, 0);  // 0
    assert(y >>> a, 0); // 0
    assert(y >> b, 0);  // 0
    assert(y >>> b, 0); // 0
}