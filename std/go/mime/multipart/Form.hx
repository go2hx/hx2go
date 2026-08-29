package go.mime.multipart;

/**
    Form is a parsed multipart form.
    Its File parts are stored either in memory or on disk,
    and are accessible via the [*FileHeader]'s Open method.
    Its Value parts are stored as strings.
    Both are keyed by field name.
**/
@:structInit
@:go.Type({ name: "Form", instanceName: "multipart.Form", imports: ["mime/multipart"] })
extern class Form {

    @:native("Value") var value: go.Map<String, go.Slice<String>>;
    @:native("File") var file: go.Map<String, go.Slice<go.Pointer<go.mime.multipart.FileHeader>>>;

    function new(value: go.Map<String, go.Slice<String>>=null, file: go.Map<String, go.Slice<go.Pointer<go.mime.multipart.FileHeader>>>=null);

    /**
        RemoveAll removes any temporary files associated with a [Form].
    **/
    @:native("RemoveAll") function removeAll(): (go.Error);

}