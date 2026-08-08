function main() {
    trace(Std.isOfType(new Sub(), Sup) == true);
}

private class Sup {
    public function new() {}
}

private class Sub extends Sup {
    public function new() {
        super();
    }
}