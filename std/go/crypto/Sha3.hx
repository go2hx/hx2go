package go.crypto;

@:go.Type({ name: "sha3", instanceName: "sha3.sha3", imports: ["crypto/sha3"] })
extern class Sha3 {

    @:native("New224") static function new224(): go.Pointer<go.crypto.sha3.SHA3>;
    @:native("New256") static function new256(): go.Pointer<go.crypto.sha3.SHA3>;
    @:native("New384") static function new384(): go.Pointer<go.crypto.sha3.SHA3>;
    @:native("New512") static function new512(): go.Pointer<go.crypto.sha3.SHA3>;
    @:native("NewCSHAKE128") static function newCSHAKE128(N: go.Slice<go.Byte>, S: go.Slice<go.Byte>): go.Pointer<go.crypto.sha3.SHAKE>;
    @:native("NewCSHAKE256") static function newCSHAKE256(N: go.Slice<go.Byte>, S: go.Slice<go.Byte>): go.Pointer<go.crypto.sha3.SHAKE>;
    @:native("NewSHAKE128") static function newSHAKE128(): go.Pointer<go.crypto.sha3.SHAKE>;
    @:native("NewSHAKE256") static function newSHAKE256(): go.Pointer<go.crypto.sha3.SHAKE>;
    @:native("Sum224") static function sum224(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 28>;
    @:native("Sum256") static function sum256(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 32>;
    @:native("Sum384") static function sum384(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 48>;
    @:native("Sum512") static function sum512(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 64>;
    @:native("SumSHAKE128") static function sumSHAKE128(data: go.Slice<go.Byte>, length: go.GoInt): go.Slice<go.Byte>;
    @:native("SumSHAKE256") static function sumSHAKE256(data: go.Slice<go.Byte>, length: go.GoInt): go.Slice<go.Byte>;

}