package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "SchedCtxArg", instanceName: "format.SchedCtxArg", imports: ["internal/trace/traceviewer/format"] })
extern class SchedCtxArg {

    @:native("ThreadID") var threadID: go.UInt64;
    @:native("ProcID") var procID: go.UInt64;

function new(threadID: go.UInt64, procID: go.UInt64);

}