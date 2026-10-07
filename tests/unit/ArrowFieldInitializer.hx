package unit;

@:keep
private class Holder {
    public var value = () -> { return 28; };
}

function main() {
    assert(Type.createInstance(Holder, []).value() == 28);
}
