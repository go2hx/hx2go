package go.crypto;

@:go.Type({ name: "sha512", instanceName: "sha512.sha512", imports: ["crypto/sha512"] })
extern class Sha512 {

    @:native("BlockSize") static var BlockSize: go.GoInt;
    @:native("Size") static var Size: go.GoInt;
    @:native("Size224") static var Size224: go.GoInt;
    @:native("Size256") static var Size256: go.GoInt;
    @:native("Size384") static var Size384: go.GoInt;

    @:native("New") static function _new(): go.hash.Hash;
    @:native("New384") static function new384(): go.hash.Hash;
    @:native("New512_224") static function new512_224(): go.hash.Hash;
    @:native("New512_256") static function new512_256(): go.hash.Hash;
    @:native("Sum384") static function sum384(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 48>;
    @:native("Sum512") static function sum512(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 64>;
    @:native("Sum512_224") static function sum512_224(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 28>;
    @:native("Sum512_256") static function sum512_256(data: go.Slice<go.Byte>): go.GoArray<go.Byte, 32>;

}