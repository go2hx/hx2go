package go.net.http;

@:structInit
@:go.Type({ name: "chunkWriter", instanceName: "http.chunkWriter", imports: ["net/http"] })
extern class ChunkWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}