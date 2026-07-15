package go.hash;

@:go.Type({ name: "crc32", instanceName: "crc32.crc32", imports: ["hash/crc32"] })
extern class Crc32 {

    @:native("Castagnoli") static var Castagnoli: go.GoInt;
    @:native("IEEE") static var IEEE: go.GoInt;
    @:native("Koopman") static var Koopman: go.GoInt;
    @:native("Size") static var Size: go.GoInt;

    @:native("IEEETable") static var IEEETable: go.Pointer<go.hash.crc32.Table>;

    @:native("Checksum") static function checksum(data: go.Slice<go.Byte>, tab: go.Pointer<go.hash.crc32.Table>): go.UInt32;
    @:native("ChecksumIEEE") static function checksumIEEE(data: go.Slice<go.Byte>): go.UInt32;
    @:native("MakeTable") static function makeTable(poly: go.UInt32): go.Pointer<go.hash.crc32.Table>;
    @:native("New") static function _new(tab: go.Pointer<go.hash.crc32.Table>): go.hash.Hash32;
    @:native("NewIEEE") static function newIEEE(): go.hash.Hash32;
    @:native("Update") static function update(crc: go.UInt32, tab: go.Pointer<go.hash.crc32.Table>, p: go.Slice<go.Byte>): go.UInt32;

}