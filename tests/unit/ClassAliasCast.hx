package unit;

private class Base { public function new() {} }
private class Child extends Base { public var value = 7; }
private typedef Alias = Base;

function main() {
    var base:Alias = new Child();
    var child:Child = cast base;
    assert(child.value == 7);
}
