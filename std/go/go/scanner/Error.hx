package go.go.scanner;

@:structInit
@:go.Type({ name: "Error", instanceName: "scanner.Error", imports: ["go/scanner"] })
extern class Error {

    @:native("Pos") var pos: go.go.token.Position;
    @:native("Msg") var msg: String;

    function new(pos: go.go.token.Position, msg: String);

    @:native("Error") function error(): (String);

}