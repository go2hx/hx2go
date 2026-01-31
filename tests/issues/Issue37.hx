package issues;

// see: https://github.com/go2hx/hx2go/issues/37
function run() {
    var i: go.GoInt = 12;
    var f: Float = 12.1;

    assert(i == f, false);
}