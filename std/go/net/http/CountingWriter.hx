package go.net.http;

@:go.Type({ name: "countingWriter", instanceName: "http.countingWriter", imports: ["net/http"] })
extern typedef CountingWriter = haxe.extern.EitherType<go.Int64, {
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}>