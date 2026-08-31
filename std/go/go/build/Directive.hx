package go.go.build;

/**
    A Directive is a Go directive comment (//go:zzz...) found in a source file.
**/
@:structInit
@:go.Type({ name: "Directive", instanceName: "build.Directive", imports: ["go/build"] })
extern class Directive {

    @:native("Text") var text: String;
    @:native("Pos") var pos: go.go.token.Position;

    function new(text: String="", pos: go.go.token.Position);

}