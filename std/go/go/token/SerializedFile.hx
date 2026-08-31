package go.go.token;

@:structInit
@:go.Type({ name: "serializedFile", instanceName: "token.serializedFile", imports: ["go/token"] })
extern class SerializedFile {

    @:native("Name") var name: std.String;
    @:native("Base") var base: go.GoInt;
    @:native("Size") var size: go.GoInt;
    @:native("Lines") var lines: go.Slice<go.GoInt>;
    @:native("Infos") var infos: go.Slice<go.go.token.LineInfo>;

    function new(name: std.String="", base: go.GoInt=0, size: go.GoInt=0, lines: go.Slice<go.GoInt>=null, infos: go.Slice<go.go.token.LineInfo>=null);

}