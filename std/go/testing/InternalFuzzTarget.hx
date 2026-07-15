package go.testing;

@:structInit
@:go.Type({ name: "InternalFuzzTarget", instanceName: "testing.InternalFuzzTarget", imports: ["testing"] })
extern class InternalFuzzTarget {

    @:native("Name") var name: String;
    @:native("Fn") var fn: (f: go.Pointer<go.testing.F>) -> Void;

function new(name: String, fn: (f: go.Pointer<go.testing.F>) -> Void);

}