package go.testing;

@:structInit
@:go.Type({ name: "fuzzResult", instanceName: "testing.fuzzResult", imports: ["testing"] })
extern class FuzzResult {

    @:native("N") var N: go.GoInt;
    @:native("T") var T: go.time.Duration;
    @:native("Error") var error: go.Error;

    function new(N: go.GoInt, T: go.time.Duration, error: go.Error);

    @:native("String") function string(): (String);

}