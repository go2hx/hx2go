package go.encoding.base64;

@:structInit
@:go.Type({ name: "newlineFilteringReader", instanceName: "base64.newlineFilteringReader", imports: ["encoding/base64"] })
extern class NewlineFilteringReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}