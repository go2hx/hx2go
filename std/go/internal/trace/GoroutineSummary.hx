package go.internal.trace;

@:structInit
@:go.Type({ name: "GoroutineSummary", instanceName: "trace.GoroutineSummary", imports: ["internal/trace"] })
extern class GoroutineSummary {

    @:native("ID") var ID: go.internal.trace.GoID;
    @:native("Name") var name: String;
    @:native("PC") var PC: go.UInt64;
    @:native("CreationTime") var creationTime: go.internal.trace.Time;
    @:native("StartTime") var startTime: go.internal.trace.Time;
    @:native("EndTime") var endTime: go.internal.trace.Time;
    @:native("Regions") var regions: go.Slice<go.Pointer<go.internal.trace.UserRegionSummary>>;
    @:native("GoroutineExecStats") var goroutineExecStats: go.internal.trace.GoroutineExecStats;

function new(ID: go.internal.trace.GoID, name: String, PC: go.UInt64, creationTime: go.internal.trace.Time, startTime: go.internal.trace.Time, endTime: go.internal.trace.Time, regions: go.Slice<go.Pointer<go.internal.trace.UserRegionSummary>>, goroutineExecStats: go.internal.trace.GoroutineExecStats);

    @:native("NonOverlappingStats") function nonOverlappingStats(): go.Map<String, go.time.Duration>;
    @:native("UnknownTime") function unknownTime(): go.time.Duration;

}