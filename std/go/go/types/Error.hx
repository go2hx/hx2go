package go.go.types;

@:structInit
@:go.Type({ name: "Error", instanceName: "types.Error", imports: ["go/types"] })
extern class Error {

    @:native("Fset") var fset: go.Pointer<go.go.token.FileSet>;
    @:native("Pos") var pos: go.go.token.Pos;
    @:native("Msg") var msg: String;
    @:native("Soft") var soft: Bool;

    function new(fset: go.Pointer<go.go.token.FileSet>, pos: go.go.token.Pos, msg: String, soft: Bool);

    @:native("Error") function error(): (String);

}