package go.go.build;

@:structInit
@:go.Type({ name: "NoGoError", instanceName: "build.NoGoError", imports: ["go/build"] })
extern class NoGoError {

    @:native("Dir") var dir: String;

function new(dir: String);

    @:native("Error") function error(): String;

}