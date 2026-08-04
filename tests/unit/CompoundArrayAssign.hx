package unit;

var calls = 0;
function idx() {
    calls++;
    return 0;
}

function main() {
    var g = [1];
    g[3] += 7;
    assert(g.length == 4);
    assert(g[0] == 1);
    assert(g[2] == 0);
    assert(g[3] == 7);

    var a = [8, 8, 8, 8];
    a[0] += 2;
    a[1] -= 2;
    a[2] *= 2;
    a[3] |= 1;
    assert(a[0] == 10);
    assert(a[1] == 6);
    assert(a[2] == 16);
    assert(a[3] == 9);

    var f = [7.5];
    f[0] %= 2.0;
    assert(f[0] == 1.5);

    var d = [1, 2, 3];
    d[idx()] += 100;
    assert(d[0] == 101);
    assert(d[1] == 2);
    assert(calls == 1);

    var y:Dynamic = [1, 2, 3];
    y[idx()] += 100;
    assert(y[0] == 101);
    assert(y[1] == 2);
    assert(calls == 2);
}
