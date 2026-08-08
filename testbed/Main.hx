function main() {
    var a : IA = new C();
    var b : IB = a;
    trace(b.b() == "b");
}

private class C implements IA {
    public function new() {}
    public function b() return "b";
}

private interface IA extends IB {}

private interface IB {
    function b() : String;
}
