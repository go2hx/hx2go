class Foo {

    public var foo(get, set): Int;

    function set_foo(value:Int):Int {
        trace('set foo', value);
        return value;
    }


    function get_foo():Int {
        trace('get foo');
        return 0;
    }

    public function new() {}

}

function main() {
    var foo: Foo = new Foo();
    foo.foo = 5;
    trace(foo.foo);

    var foo_dyn: Dynamic = foo;
    trace(Reflect.getProperty(foo_dyn, "foo"));
    Reflect.setProperty(foo_dyn, "foo", 20);
    trace(Reflect.getProperty(foo_dyn, "foo"));
}