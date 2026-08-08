function main() {
    // too many arguments in call to Hx_Obj_foo_CreateInstance
    new Foo(1,2,3).foo(1,2,3);
}

class Foo {
    public function new(x:haxe.Rest<Int>) {}
    public function foo(x:haxe.Rest<Int>) {
        trace(x.toArray(), x.toString(), x.iterator());
    }
}