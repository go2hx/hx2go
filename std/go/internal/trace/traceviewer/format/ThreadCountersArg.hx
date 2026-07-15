package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "ThreadCountersArg", instanceName: "format.ThreadCountersArg", imports: ["internal/trace/traceviewer/format"] })
extern class ThreadCountersArg {

    @:native("Running") var running: go.Int64;
    @:native("InSyscall") var inSyscall: go.Int64;

function new(running: go.Int64, inSyscall: go.Int64);

}