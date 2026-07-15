package go.log.slog;

@:structInit
@:go.Type({ name: "Value", instanceName: "slog.Value", imports: ["log/slog"] })
extern class Value {

    @:native("Any") function any(): Dynamic;
    @:native("Bool") function bool(): Bool;
    @:native("Duration") function duration(): go.time.Duration;
    @:native("Equal") function equal(w: go.log.slog.Value): Bool;
    @:native("Float64") function float64(): Float;
    @:native("Group") function group(): go.Slice<go.log.slog.Attr>;
    @:native("Int64") function int64(): go.Int64;
    @:native("Kind") function kind(): go.log.slog.Kind;
    @:native("LogValuer") function logValuer(): go.log.slog.LogValuer;
    @:native("Resolve") function resolve(): go.log.slog.Value;
    @:native("String") function string(): String;
    @:native("Time") function time(): go.time.Time;
    @:native("Uint64") function uint64(): go.UInt64;

}