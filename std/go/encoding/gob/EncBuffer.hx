package go.encoding.gob;

@:structInit
@:go.Type({ name: "encBuffer", instanceName: "gob.encBuffer", imports: ["encoding/gob"] })
extern class EncBuffer {

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Len") function len(): (go.GoInt);
    @:native("Reset") function reset(): Void;
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): Void;

}