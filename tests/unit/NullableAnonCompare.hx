package unit;

typedef Out = {
    s: Null<String>,
    n: Null<Int>,
};

private var outputs: Map<String, Out> = new Map();

private function getOutput(name: String): Out {
    if (!outputs.exists(name)) {
        outputs[name] = { s: null, n: null };
    }
    return outputs[name];
}

function main() {
    var out = getOutput("a");
    assert(out.s == null);
    assert(!(out.s != null));
    assert(out.n == null);

    out.s = "hi";
    out.n = 0;
    assert(out.s != null);
    assert(out.s == "hi");
    assert(out.n != null);
    assert(out.n == 0);
}
