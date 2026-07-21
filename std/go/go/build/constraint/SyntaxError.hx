package go.go.build.constraint;

@:structInit
@:go.Type({ name: "SyntaxError", instanceName: "constraint.SyntaxError", imports: ["go/build/constraint"] })
extern class SyntaxError {

    @:native("Offset") var offset: go.GoInt;
    @:native("Err") var err: String;

    function new(offset: go.GoInt, err: String);

    @:native("Error") function error(): (String);

}