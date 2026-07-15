package go.internal.coverage.calloc;

@:structInit
@:go.Type({ name: "BatchCounterAlloc", instanceName: "calloc.BatchCounterAlloc", imports: ["internal/coverage/calloc"] })
extern class BatchCounterAlloc {

    @:native("AllocateCounters") function allocateCounters(n: go.GoInt): go.Slice<go.UInt32>;

}