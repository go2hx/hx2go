package go.go.token;

@:structInit
@:go.Type({ name: "serializedFileSet", instanceName: "token.serializedFileSet", imports: ["go/token"] })
extern class SerializedFileSet {

    @:native("Base") var base: go.GoInt;
    @:native("Files") var files: go.Slice<go.go.token.SerializedFile>;

    function new(base: go.GoInt, files: go.Slice<go.go.token.SerializedFile>);

}