package go.internal.trace;

@:structInit
@:go.Type({ name: "MMUCurve", instanceName: "trace.MMUCurve", imports: ["internal/trace"] })
extern class MMUCurve {

    @:native("Examples") function examples(window: go.time.Duration, n: go.GoInt): go.Slice<go.internal.trace.UtilWindow>;
    @:native("MMU") function MMU(window: go.time.Duration): Float;
    @:native("MUD") function MUD(window: go.time.Duration, quantiles: go.Slice<Float>): go.Slice<Float>;

}