package go.internal.coverage.slicereader;

@:structInit
@:go.Type({ name: "Reader", instanceName: "slicereader.Reader", imports: ["internal/coverage/slicereader"] })
extern class Reader {

    @:native("Offset") function offset(): go.Int64;
    @:native("Read") function read(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadString") function readString(len: go.Int64): String;
    @:native("ReadULEB128") function readULEB128(): go.UInt64;
    @:native("ReadUint32") function readUint32(): go.UInt32;
    @:native("ReadUint64") function readUint64(): go.UInt64;
    @:native("ReadUint8") function readUint8(): go.UInt8;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;

}