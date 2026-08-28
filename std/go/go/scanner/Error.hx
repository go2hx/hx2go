package go.go.scanner;

/**
    In an [ErrorList], an error is represented by an *Error.
    The position Pos, if valid, points to the beginning of
    the offending token, and the error condition is described
    by Msg.
**/
@:structInit
@:go.Type({ name: "Error", instanceName: "scanner.Error", imports: ["go/scanner"] })
extern class Error {

    @:native("Pos") var pos: go.go.token.Position;
    @:native("Msg") var msg: String;

    function new(pos: go.go.token.Position, msg: String="");

    /**
        Error implements the error interface.
    **/
    @:native("Error") function error(): (String);

}