package go.os.exec;

@:structInit
@:go.Type({ name: "ExitError", instanceName: "exec.ExitError", imports: ["os/exec"] })
extern class ExitError {

    @:native("ProcessState") var processState: go.Pointer<go.os.ProcessState>;
    @:native("Stderr") var stderr: go.Slice<go.Byte>;

    function new(processState: go.Pointer<go.os.ProcessState>, stderr: go.Slice<go.Byte>);

    @:native("Error") function error(): (String);
    @:native("ExitCode") function exitCode(): (go.GoInt);
    @:native("Exited") function exited(): (Bool);
    @:native("Pid") function pid(): (go.GoInt);
    @:native("String") function string(): (String);
    @:native("Success") function success(): (Bool);
    @:native("Sys") function sys(): (Dynamic);
    @:native("SysUsage") function sysUsage(): (Dynamic);
    @:native("SystemTime") function systemTime(): (go.time.Duration);
    @:native("UserTime") function userTime(): (go.time.Duration);

}