package go.net;

@:go.Type({ name: "Buffers", instanceName: "net.Buffers", imports: ["net"] })
extern class Buffers {

    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteTo") function writeTo(w: go.io.Writer): go.Result<go.Int64>;

}