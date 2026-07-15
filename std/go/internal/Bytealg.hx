package go.internal;

@:go.Type({ name: "bytealg", instanceName: "bytealg.bytealg", imports: ["internal/bytealg"] })
extern class Bytealg {

    @:native("MaxBruteForce") static var MaxBruteForce: go.GoInt;
    @:native("PrimeRK") static var PrimeRK: go.GoInt;

    @:native("MaxLen") static var MaxLen: go.GoInt;

    @:native("Compare") static function compare(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): go.GoInt;
    @:native("CompareString") static function compareString(a: String, b: String): go.GoInt;
    @:native("Count") static function count(b: go.Slice<go.Byte>, c: go.Byte): go.GoInt;
    @:native("CountString") static function countString(s: String, c: go.Byte): go.GoInt;
    @:native("Cutover") static function cutover(n: go.GoInt): go.GoInt;
    @:native("Equal") static function equal(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): Bool;
    @:go.Tuple("p0", "p1") @:native("HashStr") static function hashStr<T: string | []byte>(sep: T): go.Tuple<{ p0: go.UInt32, p1: go.UInt32 }>;
    @:go.Tuple("p0", "p1") @:native("HashStrRev") static function hashStrRev<T: string | []byte>(sep: T): go.Tuple<{ p0: go.UInt32, p1: go.UInt32 }>;
    @:native("Index") static function index(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): go.GoInt;
    @:native("IndexByte") static function indexByte(b: go.Slice<go.Byte>, c: go.Byte): go.GoInt;
    @:native("IndexByteString") static function indexByteString(s: String, c: go.Byte): go.GoInt;
    @:native("IndexRabinKarp") static function indexRabinKarp<T: string | []byte>(s: T, sep: T): go.GoInt;
    @:native("IndexString") static function indexString(a: String, b: String): go.GoInt;
    @:native("LastIndexByte") static function lastIndexByte(s: go.Slice<go.Byte>, c: go.Byte): go.GoInt;
    @:native("LastIndexByteString") static function lastIndexByteString(s: String, c: go.Byte): go.GoInt;
    @:native("LastIndexRabinKarp") static function lastIndexRabinKarp<T: string | []byte>(s: T, sep: T): go.GoInt;
    @:native("MakeNoZero") static function makeNoZero(n: go.GoInt): go.Slice<go.Byte>;

}