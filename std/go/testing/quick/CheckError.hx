package go.testing.quick;

@:structInit
@:go.Type({ name: "CheckError", instanceName: "quick.CheckError", imports: ["testing/quick"] })
extern class CheckError {

    @:native("Count") var count: go.GoInt;
    @:native("In") var _in: go.Slice<Dynamic>;

function new(count: go.GoInt, _in: go.Slice<Dynamic>);

    @:native("Error") function error(): String;

}