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

        Sys.println(cls.waa);
        Sys.println(obj.x);
        Sys.println(obj.y);
        Sys.println(obj.y.foo);
        Sys.println(obj.y.bar);
    }

}