package unit;

function main() {
    getInfo(Y(0, 1));
}

private function getInfo(e: EnumValue) {
    assert(e.getIndex() == 1);
    var a = e.getParameters();
    assert(a.length == 2);
    assert(a[1] == 1);
}

private enum Foo {
    X;
    Y(x: Int, y: Float);
}