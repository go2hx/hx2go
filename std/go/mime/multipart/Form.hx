package go.mime.multipart;

@:structInit
@:go.Type({ name: "Form", instanceName: "multipart.Form", imports: ["mime/multipart"] })
extern class Form {

    @:native("Value") var value: go.Map<String, go.Slice<String>>;
    @:native("File") var file: go.Map<String, go.Slice<go.Pointer<go.mime.multipart.FileHeader>>>;

    function new(value: go.Map<String, go.Slice<String>>=null, file: go.Map<String, go.Slice<go.Pointer<go.mime.multipart.FileHeader>>>=null);

    @:native("RemoveAll") function removeAll(): (go.Error);

}