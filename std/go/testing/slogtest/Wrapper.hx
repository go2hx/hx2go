package go.testing.slogtest;

@:structInit
@:go.Type({ name: "wrapper", instanceName: "slogtest.wrapper", imports: ["testing/slogtest"] })
extern class Wrapper {

    @:native("Handler") var handler: go.log.slog.Handler;

    function new(handler: go.log.slog.Handler);

    @:native("Enabled") function enabled(p0: go.context.Context, p1: go.log.slog.Level): (Bool);
    @:native("Handle") function handle(ctx: go.context.Context, r: go.log.slog.Record): (go.Error);
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): (go.log.slog.Handler);
    @:native("WithGroup") function withGroup(name: String): (go.log.slog.Handler);

}