package go.crypto;

@:go.Type({ name: "sha256", instanceName: "sha256.sha256", imports: ["crypto/sha256"] })
extern class Sha256 {

    @:native("BlockSize") static var BlockSize: go.GoInt;
    @:native("Size") static var Size: go.GoInt;
    @:native("Size224") static var Size224: go.GoInt;

    @:native("New") static function _new(): go.hash.Hash;
    @:native("New224") static function new224(): go.hash.Hash;
    @:native("Sum224") static function sum224(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 28>;
    @:native("Sum256") static function sum256(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 32>;

}