package go.net.http;

@:go.Type({ name: "http2pipeBuffer", instanceName: "http.http2pipeBuffer", imports: ["net/http"] })
extern typedef Http2pipeBuffer = {

    @:native("Len") function len(): (go.GoInt);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}