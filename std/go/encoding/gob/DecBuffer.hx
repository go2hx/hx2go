package go.encoding.gob;

@:structInit
@:go.Type({ name: "decBuffer", instanceName: "gob.decBuffer", imports: ["encoding/gob"] })
extern class DecBuffer {

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Drop") function drop(n: go.GoInt): Void;
    @:native("Len") function len(): (go.GoInt);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    @:native("Reset") function reset(): Void;
    @:native("SetBytes") function setBytes(data: go.Slice<go.Byte>): Void;

}