package unit;

function main() {
    var d:Dynamic = 1;
    var ni:Null<Int> = 1;
    var nf:Null<Float> = 1.;
    var nn:Null<Int> = null;

    assert(d == ni);
    assert(!(d > ni));
    assert(!(d < ni));
    assert(d == nf);
    assert(!(d > nf));
    assert(!(d < nf));
    assert(!(d > nn));
    assert(!(d < nn));
    assert(nf >= d);
    assert(!(ni > d));
}
