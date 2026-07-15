package go.internal.trace;

@:structInit
@:go.Type({ name: "Sync", instanceName: "trace.Sync", imports: ["internal/trace"] })
extern class Sync {

    @:native("N") var N: go.GoInt;
    @:native("ClockSnapshot") var clockSnapshot: go.Pointer<go.internal.trace.ClockSnapshot>;
    @:native("ExperimentalBatches") var experimentalBatches: go.Map<String, go.Slice<go.internal.trace.ExperimentalBatch>>;

function new(N: go.GoInt, clockSnapshot: go.Pointer<go.internal.trace.ClockSnapshot>, experimentalBatches: go.Map<String, go.Slice<go.internal.trace.ExperimentalBatch>>);

}