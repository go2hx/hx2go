package go.encoding.base32;

@:structInit
@:go.Type({ name: "newlineFilteringReader", instanceName: "base32.newlineFilteringReader", imports: ["encoding/base32"] })
extern class NewlineFilteringReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}