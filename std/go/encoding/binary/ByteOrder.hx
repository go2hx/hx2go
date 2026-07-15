package go.encoding.binary;

@:go.Type({ name: "ByteOrder", instanceName: "binary.ByteOrder", imports: ["encoding/binary"] })
extern typedef ByteOrder = {

    @:native("PutUint16") function putUint16(p0: go.Slice<go.Byte>, p1: go.UInt16): Void;
    @:native("PutUint32") function putUint32(p0: go.Slice<go.Byte>, p1: go.UInt32): Void;
    @:native("PutUint64") function putUint64(p0: go.Slice<go.Byte>, p1: go.UInt64): Void;
    @:native("String") function string(): String;
    @:native("Uint16") function uint16(p0: go.Slice<go.Byte>): go.UInt16;
    @:native("Uint32") function uint32(p0: go.Slice<go.Byte>): go.UInt32;
    @:native("Uint64") function uint64(p0: go.Slice<go.Byte>): go.UInt64;

}