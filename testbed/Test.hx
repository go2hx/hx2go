import runtime.HxDynamic;

class Wee {

    public var waa: Float;

    public function new (_w: Float) {
        waa = _w;
    }

}

class Waa extends Wee {}

@:analyzer(ignore)
class Test {

    static function main() {
        var cls: Dynamic = new Waa(12.34);
        var obj: Dynamic = {
            x: 5,
            y: {
                foo: 10,
                bar: 20
            }
        };

        Sys.println("read");
        Sys.println("cls.waa: " + cls.waa);
        Sys.println("obj.x: " + obj.x);
        Sys.println("obj.y: " + obj.y);
        Sys.println("obj.y.foo: " + obj.y.foo);
        Sys.println("obj.y.bar: " + obj.y.bar);
         Sys.println(obj.y.foo + obj.y.bar + cls.waa);

        Sys.println("write");
        Sys.println("before: " + obj.y.foo + " and " + cls.waa);
        obj.y.foo = 20;
        obj.y.foo *= 2;
        cls.waa = 56.78;
        cls.waa -= 0.01;
        Sys.println("after: " + obj.y.foo + " and " + cls.waa);
    }

}