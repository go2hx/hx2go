package go.encoding.binary;

@:structInit
@:go.Type({ name: "littleEndian", instanceName: "binary.littleEndian", imports: ["encoding/binary"] })
extern class LittleEndian {

    @:native("AppendUint16") function appendUint16(b: go.Slice<go.Byte>, v: go.UInt16): (go.Slice<go.Byte>);
    @:native("AppendUint32") function appendUint32(b: go.Slice<go.Byte>, v: go.UInt32): (go.Slice<go.Byte>);
    @:native("AppendUint64") function appendUint64(b: go.Slice<go.Byte>, v: go.UInt64): (go.Slice<go.Byte>);
    @:native("GoString") function goString(): (String);
    @:native("PutUint16") function putUint16(b: go.Slice<go.Byte>, v: go.UInt16): Void;
    @:native("PutUint32") function putUint32(b: go.Slice<go.Byte>, v: go.UInt32): Void;
    @:native("PutUint64") function putUint64(b: go.Slice<go.Byte>, v: go.UInt64): Void;
    @:native("String") function string(): (String);
    @:native("Uint16") function uint16(b: go.Slice<go.Byte>): (go.UInt16);
    @:native("Uint32") function uint32(b: go.Slice<go.Byte>): (go.UInt32);
    @:native("Uint64") function uint64(b: go.Slice<go.Byte>): (go.UInt64);

}