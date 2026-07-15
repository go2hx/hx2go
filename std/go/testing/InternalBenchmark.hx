package go.testing;

@:structInit
@:go.Type({ name: "InternalBenchmark", instanceName: "testing.InternalBenchmark", imports: ["testing"] })
extern class InternalBenchmark {

    @:native("Name") var name: String;
    @:native("F") var F: (b: go.Pointer<go.testing.B>) -> Void;

function new(name: String, F: (b: go.Pointer<go.testing.B>) -> Void);

}