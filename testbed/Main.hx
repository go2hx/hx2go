import haxe.Json;
class Foo {
    public function new() {}
    public function bar(a: Int, b: Int) {
        trace("bar", a + b);
        return a + b;
    }
}

enum Bar {
    A;
    B;
}

function main() {
    var foo: Foo = new Foo();
    var foo_dyn: Dynamic = foo;

    var field = Reflect.field(foo_dyn, "bar");
    var res = Reflect.callMethod(foo_dyn, field, [5, 10.5]);

    trace(res, Reflect.isFunction(field), Reflect.isFunction(res)); // 15, true, false

    var obj = {
        x: 10,
        y: 20,
    }

    var ev = Bar.A;
    var ev_dyn: Dynamic = ev;

    var cls: Class<Dynamic> = cast foo;

    trace(obj, cls, Reflect.isObject(cls), Reflect.isObject(obj), Reflect.isObject(foo_dyn), Reflect.isObject(foo), Reflect.isObject(null), Reflect.isObject(5), Reflect.isObject("hello"), Reflect.isObject(true), Reflect.isObject(ev)); // true, true, true, true, false, false, false, false, false
    trace(Reflect.isEnumValue(cls), Reflect.isEnumValue(ev), Reflect.isEnumValue(ev_dyn)); // false, true, true

    trace(obj, obj.x, obj.y); // { x => 10, y => 20 }, 10, 20
    Reflect.deleteField(obj, "x");
    trace(obj, obj.x, obj.y); // { y => 20 }, null, 20

    Reflect.setField(obj, "x", 30);
    trace(obj, obj.x, obj.y); // { x => 30, y => 20 }, 30, 20

    trace(Reflect.fields(obj)); // ["x", "y"]
    trace(Reflect.hasField(obj, "x"), Reflect.hasField(obj, "y"), Reflect.hasField(obj, "z")); // true, true, false

    trace(Json.parse('{"x": 10, "y": 20, "nested": {"a": 1, "b": 2}}')); // { x => 10, y => 20, nested => { a => 1, b => 2 } }
    trace(Json.stringify(obj)); // {"x":30,"y":20}

    trace(Type.typeof(foo), Type.typeof(ev), Type.typeof(obj), Type.typeof(5), Type.typeof("hello"), Type.typeof(true), Type.typeof(null), Type.typeof([1, 2, 3])); // TClass, TEnum, TObject, TInt, TClass, TBool, TNull, TClass
}