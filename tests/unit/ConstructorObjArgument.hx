package unit;

private class Holder {
    public var value:Int;
    public function new(obj:Int) value = obj;
}

function main() {
    assert(new Holder(7).value == 7);
}
