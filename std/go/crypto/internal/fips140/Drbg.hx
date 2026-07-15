package go.crypto.internal.fips140;

@:go.Type({ name: "drbg", instanceName: "drbg.drbg", imports: ["crypto/internal/fips140/drbg"] })
extern class Drbg {

    @:native("SeedSize") static var SeedSize: go.GoInt;

    @:native("NewCounter") static function newCounter(entropy: go.Pointer<go.GoArray<go.Byte, 48>>): go.Pointer<go.crypto.internal.fips140.drbg.Counter>;
    @:native("Read") static function read(b: go.Slice<go.Byte>): Void;
    @:native("ReadWithReader") static function readWithReader(r: go.io.Reader, b: go.Slice<go.Byte>): go.Error;
    @:native("SetTestingReader") static function setTestingReader(r: go.io.Reader): Void;

}