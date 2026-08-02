package go.mime.multipart;

@:structInit
@:go.Type({ name: "part", instanceName: "multipart.part", imports: ["mime/multipart"] })
extern class Part_ {

    @:native("Write") function write(d: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}