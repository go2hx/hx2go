package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "GoroutineCountersArg", instanceName: "format.GoroutineCountersArg", imports: ["internal/trace/traceviewer/format"] })
extern class GoroutineCountersArg {

    @:native("Running") var running: go.UInt64;
    @:native("Runnable") var runnable: go.UInt64;
    @:native("GCWaiting") var gCWaiting: go.UInt64;

function new(running: go.UInt64, runnable: go.UInt64, gCWaiting: go.UInt64);

}