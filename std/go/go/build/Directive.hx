package go.go.build;

@:structInit
@:go.Type({ name: "Directive", instanceName: "build.Directive", imports: ["go/build"] })
extern class Directive {

    @:native("Text") var text: String;
    @:native("Pos") var pos: go.go.token.Position;

function new(text: String, pos: go.go.token.Position);

}