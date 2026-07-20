package go.os;

@:structInit
@:go.Type({ name: "ProcessState", instanceName: "os.ProcessState", imports: ["os"] })
extern class ProcessState {

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