package go.testing.quick;

@:structInit
@:go.Type({ name: "CheckEqualError", instanceName: "quick.CheckEqualError", imports: ["testing/quick"] })
extern class CheckEqualError {

    @:native("CheckError") var checkError: go.testing.quick.CheckError;
    @:native("Out1") var out1: go.Slice<Dynamic>;
    @:native("Out2") var out2: go.Slice<Dynamic>;

function new(checkError: go.testing.quick.CheckError, out1: go.Slice<Dynamic>, out2: go.Slice<Dynamic>);

    @:native("Error") function error(): String;

}