package go.hash;

@:go.Type({ name: "crc64", instanceName: "crc64.crc64", imports: ["hash/crc64"] })
extern class Crc64 {

    @:native("ECMA") static var ECMA: go.GoInt;
    @:native("ISO") static var ISO: go.GoInt;
    @:native("Size") static var Size: go.GoInt;

    @:native("Checksum") static function checksum(data: go.Slice<go.Byte>, tab: go.Pointer<go.hash.crc64.Table>): go.UInt64;
    @:native("MakeTable") static function makeTable(poly: go.UInt64): go.Pointer<go.hash.crc64.Table>;
    @:native("New") static function _new(tab: go.Pointer<go.hash.crc64.Table>): go.hash.Hash64;
    @:native("Update") static function update(crc: go.UInt64, tab: go.Pointer<go.hash.crc64.Table>, p: go.Slice<go.Byte>): go.UInt64;

}