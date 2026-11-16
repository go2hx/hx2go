package unit;

private typedef A = {
    function bar(): String;
}

private class C {
    public function new() {}
    public function bar() {
        return "bar";
    }
}

private function extract(a: A) {
    return invoke(a.bar);
}

private function invoke(f: () -> String) {
    return f();
}

function main() {
    assert(extract(new C()) == "bar");
}
