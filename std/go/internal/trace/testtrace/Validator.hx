package go.internal.trace.testtrace;

@:structInit
@:go.Type({ name: "Validator", instanceName: "testtrace.Validator", imports: ["internal/trace/testtrace"] })
extern class Validator {

    @:native("GoVersion") var goVersion: go.internal.trace.version.Version;

function new(goVersion: go.internal.trace.version.Version);

    @:native("Event") function event(ev: go.internal.trace.Event): go.Error;
    @:native("SkipClockSnapshotChecks") function skipClockSnapshotChecks(): Void;

}