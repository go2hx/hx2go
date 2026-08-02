package go.net.http.cgi;

@:go.Type({ name: "neverEnding", instanceName: "cgi.neverEnding", imports: ["net/http/cgi"] })
extern typedef NeverEnding = haxe.extern.EitherType<go.Byte, {
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}>