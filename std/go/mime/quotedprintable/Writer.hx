package go.mime.quotedprintable;

@:structInit
@:go.Type({ name: "Writer", instanceName: "quotedprintable.Writer", imports: ["mime/quotedprintable"] })
extern class Writer {

    @:native("Binary") var binary: Bool;

function new(binary: Bool);

    @:native("Close") function close(): go.Error;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}