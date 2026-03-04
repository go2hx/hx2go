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
        var arr: Dynamic = [5, 10, 20];
        Sys.println(arr);
        arr[3] = arr[0] * arr[1];
        Sys.println(arr);
    }

}