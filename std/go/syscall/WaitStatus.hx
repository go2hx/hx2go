package go.syscall;

@:go.Type({ name: "WaitStatus", instanceName: "syscall.WaitStatus", imports: ["syscall"] })
extern typedef WaitStatus = haxe.extern.EitherType<go.UInt32, {
    @:native("Continued") function continued(): (Bool);
    @:native("CoreDump") function coreDump(): (Bool);
    @:native("ExitStatus") function exitStatus(): (go.GoInt);
    @:native("Exited") function exited(): (Bool);
    @:native("Signal") function signal(): (go.syscall.Signal);
    @:native("Signaled") function signaled(): (Bool);
    @:native("StopSignal") function stopSignal(): (go.syscall.Signal);
    @:native("Stopped") function stopped(): (Bool);
    @:native("TrapCause") function trapCause(): (go.GoInt);

}>