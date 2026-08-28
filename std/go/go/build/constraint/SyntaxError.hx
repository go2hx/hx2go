package go.go.build.constraint;

/**
    A SyntaxError reports a syntax error in a parsed build expression.
**/
@:structInit
@:go.Type({ name: "SyntaxError", instanceName: "constraint.SyntaxError", imports: ["go/build/constraint"] })
extern class SyntaxError {

    @:native("Offset") var offset: go.GoInt;
    @:native("Err") var err: String;

    function new(offset: go.GoInt=0, err: String="");

    @:native("Error") function error(): (String);

}