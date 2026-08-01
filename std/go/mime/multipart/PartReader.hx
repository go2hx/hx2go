package go.mime.multipart;

@:structInit
@:go.Type({ name: "partReader", instanceName: "multipart.partReader", imports: ["mime/multipart"] })
extern class PartReader {

    @:native("Read") function read(d: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}