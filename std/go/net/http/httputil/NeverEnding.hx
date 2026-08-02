package go.net.http.httputil;

@:go.Type({ name: "neverEnding", instanceName: "httputil.neverEnding", imports: ["net/http/httputil"] })
extern typedef NeverEnding = haxe.extern.EitherType<go.Byte, {
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}>