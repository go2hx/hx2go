package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "HeapCountersArg", instanceName: "format.HeapCountersArg", imports: ["internal/trace/traceviewer/format"] })
extern class HeapCountersArg {

    @:native("Allocated") var allocated: go.UInt64;
    @:native("NextGC") var nextGC: go.UInt64;

function new(allocated: go.UInt64, nextGC: go.UInt64);

}