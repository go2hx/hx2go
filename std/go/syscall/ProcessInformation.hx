package go.syscall;

@:structInit
@:go.Type({ name: "ProcessInformation", instanceName: "syscall.ProcessInformation", imports: ["syscall"] })
extern class ProcessInformation {

    @:native("Process") var process: go.syscall.Handle;
    @:native("Thread") var thread: go.syscall.Handle;
    @:native("ProcessId") var processId: go.UInt32;
    @:native("ThreadId") var threadId: go.UInt32;

    function new(process: go.syscall.Handle=cast 0, thread: go.syscall.Handle=cast 0, processId: go.UInt32=0, threadId: go.UInt32=0);

}