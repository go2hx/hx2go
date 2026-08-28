package go.testing;

/**
    InternalFuzzTarget is an internal type but exported because it is
    cross-package; it is part of the implementation of the "go test" command.
**/
@:structInit
@:go.Type({ name: "InternalFuzzTarget", instanceName: "testing.InternalFuzzTarget", imports: ["testing"] })
extern class InternalFuzzTarget {

    @:native("Name") var name: String;
    @:native("Fn") var fn: (f: go.Pointer<go.testing.F>) -> Void;

    function new(name: String="", fn: (f: go.Pointer<go.testing.F>) -> Void=null);

}