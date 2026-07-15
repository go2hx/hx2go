package go.testing;

@:structInit
@:go.Type({ name: "PB", instanceName: "testing.PB", imports: ["testing"] })
extern class PB {

    @:native("Next") function next(): Bool;

}