package go.mime.multipart;

@:structInit
@:go.Type({ name: "Reader", instanceName: "multipart.Reader", imports: ["mime/multipart"] })
extern class Reader {

    @:native("NextPart") function nextPart(): go.Result<go.Pointer<go.mime.multipart.Part>>;
    @:native("NextRawPart") function nextRawPart(): go.Result<go.Pointer<go.mime.multipart.Part>>;
    @:native("ReadForm") function readForm(maxMemory: go.Int64): go.Result<go.Pointer<go.mime.multipart.Form>>;

}