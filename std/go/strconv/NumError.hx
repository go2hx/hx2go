package go.strconv;

@:structInit
@:go.Type({ name: "NumError", instanceName: "strconv.NumError", imports: ["strconv"] })
extern class NumError {

    @:native("Func") var func: String;
    @:native("Num") var num: String;
    @:native("Err") var err: go.Error;

    function new(func: String="", num: String="", err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}