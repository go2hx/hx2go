package go.os;

@:structInit
@:go.Type({ name: "Process", instanceName: "os.Process", imports: ["os"] })
extern class Process {

    @:native("Pid") var pid: go.GoInt;

    function new(pid: go.GoInt);

    @:native("Kill") function kill(): (go.Error);
    @:native("Release") function release(): (go.Error);
    @:native("Signal") function signal(sig: go.os.Signal): (go.Error);
    @:native("Wait") function wait(): go.Result<go.Pointer<go.os.ProcessState>>;
    @:native("WithHandle") function withHandle(f: (handle: go.UIntPtr) -> Void): (go.Error);

}