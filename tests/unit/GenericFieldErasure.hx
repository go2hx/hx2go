package unit;

function main() {
    var p = new GenericFieldErasureSub();
    p.value = new GenericFieldErasureFoo();
    p.value.foo = "hi";

    var closure = p.get;

    assert(p.value.foo == "hi");
    assert(p.get().foo == "hi");
    assert(closure().foo == "hi");
    assert(p.count("ab") == 2);
}

class GenericFieldErasureBase<T> {
    public var value:T;
    public function new() {}
    public function get():T return value;
    public function count(v:String):Int return v.length;
}

class GenericFieldErasureSub extends GenericFieldErasureBase<GenericFieldErasureFoo> {
    public function new() super();
}

class GenericFieldErasureFoo {
    public var foo:String = "";
    public function new() {}
}
