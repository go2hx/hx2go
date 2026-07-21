package go.go.token;

@:structInit
@:go.Type({ name: "serializedFile", instanceName: "token.serializedFile", imports: ["go/token"] })
extern class SerializedFile {

    @:native("Name") var name: String;
    @:native("Base") var base: go.GoInt;
    @:native("Size") var size: go.GoInt;
    @:native("Lines") var lines: go.Slice<go.GoInt>;
    @:native("Infos") var infos: go.Slice<go.go.token.LineInfo>;

    function new(name: String, base: go.GoInt, size: go.GoInt, lines: go.Slice<go.GoInt>, infos: go.Slice<go.go.token.LineInfo>);

}