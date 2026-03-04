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
        var arr: Dynamic = [1, 2, 3];
        Sys.println(arr);
        Sys.println(arr[0] * arr[2]);
    }

}