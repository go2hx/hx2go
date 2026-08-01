package go.encoding.pem;

@:structInit
@:go.Type({ name: "lineBreaker", instanceName: "pem.lineBreaker", imports: ["encoding/pem"] })
extern class LineBreaker {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}