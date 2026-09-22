package unit;
class NullableHolder {
    public var b:Null<Bool> = true;
    public function new() {}
}

function main() {
    assert(new NullableHolder().b);
}