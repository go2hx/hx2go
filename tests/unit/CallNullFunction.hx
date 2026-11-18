package unit;

inline function invoke(f: (item: Int) -> Void) {
    f(1);
}

function main() {
    var caught = false;
    try {
        invoke(null);
    } catch (_: Dynamic) {
        caught = true;
    }
    assert(caught);
}
