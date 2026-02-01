package issues;
import go.Go;

// see: https://github.com/go2hx/hx2go/issues/37
function run() {
    var i: go.GoInt = 12;
    var f: Float = 12.1;

    assert(i == f, false);

    var hi: Int = 15;
    var hf: Float = 20;

    var i32 = Go.int32(10);
    var u32 = Go.uint32(10);

    assert(hi == hf, false);
    assert(i32 == u32, true);
}