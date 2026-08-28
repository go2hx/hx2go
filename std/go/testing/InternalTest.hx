package go.testing;

/**
    InternalTest is an internal type but exported because it is cross-package;
    it is part of the implementation of the "go test" command.
**/
@:structInit
@:go.Type({ name: "InternalTest", instanceName: "testing.InternalTest", imports: ["testing"] })
extern class InternalTest {

    @:native("Name") var name: String;
    @:native("F") var F: (p0: go.Pointer<go.testing.T>) -> Void;

    function new(name: String="", F: (p0: go.Pointer<go.testing.T>) -> Void=null);

}