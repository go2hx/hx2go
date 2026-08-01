package go.runtime.trace;

@:go.Type({ name: "eventTime", instanceName: "trace.eventTime", imports: ["runtime/trace"] })
extern typedef EventTime = haxe.extern.EitherType<go.Int64, {
    @:native("Sub") function sub(t0: go.runtime.trace.EventTime): (go.time.Duration);

}>