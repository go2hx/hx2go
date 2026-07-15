package go.crypto;

@:go.Type({ name: "rand", instanceName: "rand.rand", imports: ["crypto/rand"] })
extern class Rand {

    @:native("Reader") static var Reader: go.io.Reader;

    @:native("Int") static function int(rand: go.io.Reader, max: go.Pointer<go.math.big.Int>): go.Result<go.Pointer<go.math.big.Int>>;
    @:native("Prime") static function prime(r: go.io.Reader, bits: go.GoInt): go.Result<go.Pointer<go.math.big.Int>>;
    @:native("Read") static function read(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Text") static function text(): String;

}