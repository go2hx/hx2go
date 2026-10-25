package go.syscall;

/**
    DLLError describes reasons for DLL load failures.
**/
@:structInit
@:go.Type({ name: "DLLError", instanceName: "syscall.DLLError", imports: ["syscall"] })
extern class DLLError {

    @:native("Err") var err: go.Error;
    @:native("ObjName") var objName: String;
    @:native("Msg") var msg: String;

    function new(err: go.Error=null, objName: String="", msg: String="");

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}