package go.crypto;

@:go.Type({ name: "sha1", instanceName: "sha1.sha1", imports: ["crypto/sha1"] })
extern class Sha1_ {

    @:native("BlockSize") static var blockSize: go.GoInt;
    @:native("Size") static var size: go.GoInt;

    @:native("New") static function _new(): (go.hash.Hash);
    @:native("Sum") static function sum(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 20>);

}