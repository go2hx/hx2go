package go.strconv;

@:go.Type({ name: "strconv", imports: ["strconv"] })
extern class Strconv {
    static function atoi(x: String):Result<Int>;
    static function parseFloat(x: String, bitSize:Int):Result<Float>;
}