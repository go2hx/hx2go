package go.go.types;

/**
    An Error describes a type-checking error; it implements the error interface.
    A "soft" error is an error that still permits a valid interpretation of a
    package (such as "unused variable"); "hard" errors may lead to unpredictable
    behavior if ignored.
**/
@:structInit
@:go.Type({ name: "Error", instanceName: "types.Error", imports: ["go/types"] })
extern class Error {

    @:native("Fset") var fset: go.Pointer<go.go.token.FileSet>;
    @:native("Pos") var pos: go.go.token.Pos;
    @:native("Msg") var msg: std.String;
    @:native("Soft") var soft: Bool;

    function new(fset: go.Pointer<go.go.token.FileSet>=null, pos: go.go.token.Pos=cast 0, msg: std.String="", soft: Bool=false);

    /**
        Error returns an error string formatted as follows:
        filename:line:column: message
    **/
    @:native("Error") function error(): (std.String);

}