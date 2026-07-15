package go.hash;

@:go.Type({ name: "adler32", instanceName: "adler32.adler32", imports: ["hash/adler32"] })
extern class Adler32 {

    @:native("Size") static var Size: go.GoInt;

    @:native("Checksum") static function checksum(data: go.Slice<go.Byte>): go.UInt32;
    @:native("New") static function _new(): go.hash.Hash32;

}