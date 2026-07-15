package go.testing;

@:structInit
@:go.Type({ name: "InternalExample", instanceName: "testing.InternalExample", imports: ["testing"] })
extern class InternalExample {

    @:native("Name") var name: String;
    @:native("F") var F: () -> Void;
    @:native("Output") var output: String;
    @:native("Unordered") var unordered: Bool;

function new(name: String, F: () -> Void, output: String, unordered: Bool);

}