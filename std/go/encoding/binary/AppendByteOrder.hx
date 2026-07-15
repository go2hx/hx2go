package go.encoding.binary;

@:go.Type({ name: "AppendByteOrder", instanceName: "binary.AppendByteOrder", imports: ["encoding/binary"] })
extern typedef AppendByteOrder = {

    @:native("AppendUint16") function appendUint16(p0: go.Slice<go.Byte>, p1: go.UInt16): go.Slice<go.Byte>;
    @:native("AppendUint32") function appendUint32(p0: go.Slice<go.Byte>, p1: go.UInt32): go.Slice<go.Byte>;
    @:native("AppendUint64") function appendUint64(p0: go.Slice<go.Byte>, p1: go.UInt64): go.Slice<go.Byte>;
    @:native("String") function string(): String;

}