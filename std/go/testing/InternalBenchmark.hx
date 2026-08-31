package go.testing;

/**
    InternalBenchmark is an internal type but exported because it is cross-package;
    it is part of the implementation of the "go test" command.
**/
@:structInit
@:go.Type({ name: "InternalBenchmark", instanceName: "testing.InternalBenchmark", imports: ["testing"] })
extern class InternalBenchmark {

    @:native("Name") var name: String;
    @:native("F") var F: (b: go.Pointer<go.testing.B>) -> Void;

    function new(name: String="", F: (b: go.Pointer<go.testing.B>) -> Void=null);

}