package go.fmt;

@:go.Type({ name: "stringReader", instanceName: "fmt.stringReader", imports: ["fmt"] })
extern typedef StringReader = haxe.extern.EitherType<String, {
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}>