package go.net.http.fcgi;

@:structInit
@:go.Type({ name: "streamWriter", instanceName: "fcgi.streamWriter", imports: ["net/http/fcgi"] })
extern class StreamWriter {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}