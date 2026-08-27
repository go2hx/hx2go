package go.crypto;

@:go.Type({ name: "md5", instanceName: "md5.md5", imports: ["crypto/md5"] })
extern class Md5_ {

    @:native("BlockSize") static var blockSize: go.GoInt;
    @:native("Size") static var size: go.GoInt;

    @:native("New") static function _new(): (go.hash.Hash);
    @:native("Sum") static function sum(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 16>);

}