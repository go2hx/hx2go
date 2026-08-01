package go.time;

@:go.Type({ name: "Duration", instanceName: "time.Duration", imports: ["time"] })
extern typedef Duration = haxe.extern.EitherType<go.Int64, {
    @:native("Abs") function abs(): (go.time.Duration);
    @:native("Hours") function hours(): (Float);
    @:native("Microseconds") function microseconds(): (go.Int64);
    @:native("Milliseconds") function milliseconds(): (go.Int64);
    @:native("Minutes") function minutes(): (Float);
    @:native("Nanoseconds") function nanoseconds(): (go.Int64);
    @:native("Round") function round(m: go.time.Duration): (go.time.Duration);
    @:native("Seconds") function seconds(): (Float);
    @:native("String") function string(): (String);
    @:native("Truncate") function truncate(m: go.time.Duration): (go.time.Duration);

}>