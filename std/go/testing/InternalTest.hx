package go.testing;

@:structInit
@:go.Type({ name: "InternalTest", instanceName: "testing.InternalTest", imports: ["testing"] })
extern class InternalTest {

    @:native("Name") var name: String;
    @:native("F") var F: (p0: go.Pointer<go.testing.T>) -> Void;

function new(name: String, F: (p0: go.Pointer<go.testing.T>) -> Void);

}