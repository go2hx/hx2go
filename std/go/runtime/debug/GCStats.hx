package go.runtime.debug;

@:structInit
@:go.Type({ name: "GCStats", instanceName: "debug.GCStats", imports: ["runtime/debug"] })
extern class GCStats {

    @:native("LastGC") var lastGC: go.time.Time;
    @:native("NumGC") var numGC: go.Int64;
    @:native("PauseTotal") var pauseTotal: go.time.Duration;
    @:native("Pause") var pause: go.Slice<go.time.Duration>;
    @:native("PauseEnd") var pauseEnd: go.Slice<go.time.Time>;
    @:native("PauseQuantiles") var pauseQuantiles: go.Slice<go.time.Duration>;

    function new(lastGC: go.time.Time, numGC: go.Int64=0, pauseTotal: go.time.Duration=cast 0, pause: go.Slice<go.time.Duration>=null, pauseEnd: go.Slice<go.time.Time>=null, pauseQuantiles: go.Slice<go.time.Duration>=null);

}