package go.encoding;

@:go.Type({ name: "binary", instanceName: "binary.binary", imports: ["encoding/binary"] })
extern class Binary {

    @:native("MaxVarintLen16") static var MaxVarintLen16: go.GoInt;
    @:native("MaxVarintLen32") static var MaxVarintLen32: go.GoInt;
    @:native("MaxVarintLen64") static var MaxVarintLen64: go.GoInt;

    @:native("Append") static function append(buf: go.Slice<go.Byte>, order: go.encoding.binary.ByteOrder, data: Dynamic): go.Result<go.Slice<go.Byte>>;
    @:native("AppendUvarint") static function appendUvarint(buf: go.Slice<go.Byte>, x: go.UInt64): go.Slice<go.Byte>;
    @:native("AppendVarint") static function appendVarint(buf: go.Slice<go.Byte>, x: go.Int64): go.Slice<go.Byte>;
    @:native("Decode") static function decode(buf: go.Slice<go.Byte>, order: go.encoding.binary.ByteOrder, data: Dynamic): go.Result<go.GoInt>;
    @:native("Encode") static function encode(buf: go.Slice<go.Byte>, order: go.encoding.binary.ByteOrder, data: Dynamic): go.Result<go.GoInt>;
    @:native("PutUvarint") static function putUvarint(buf: go.Slice<go.Byte>, x: go.UInt64): go.GoInt;
    @:native("PutVarint") static function putVarint(buf: go.Slice<go.Byte>, x: go.Int64): go.GoInt;
    @:native("Read") static function read(r: go.io.Reader, order: go.encoding.binary.ByteOrder, data: Dynamic): go.Error;
    @:native("ReadUvarint") static function readUvarint(r: go.io.ByteReader): go.Result<go.UInt64>;
    @:native("ReadVarint") static function readVarint(r: go.io.ByteReader): go.Result<go.Int64>;
    @:native("Size") static function size(v: Dynamic): go.GoInt;
    @:go.Tuple("p0", "p1") @:native("Uvarint") static function uvarint(buf: go.Slice<go.Byte>): go.Tuple<{ p0: go.UInt64, p1: go.GoInt }>;
    @:go.Tuple("p0", "p1") @:native("Varint") static function varint(buf: go.Slice<go.Byte>): go.Tuple<{ p0: go.Int64, p1: go.GoInt }>;
    @:native("Write") static function write(w: go.io.Writer, order: go.encoding.binary.ByteOrder, data: Dynamic): go.Error;

}