package go.log.slog;

@:structInit
@:go.Type({ name: "MultiHandler", instanceName: "slog.MultiHandler", imports: ["log/slog"] })
extern class MultiHandler {

    @:native("Enabled") function enabled(ctx: go.context.Context, l: go.log.slog.Level): Bool;
    @:native("Handle") function handle(ctx: go.context.Context, r: go.log.slog.Record): go.Error;
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): go.log.slog.Handler;
    @:native("WithGroup") function withGroup(name: String): go.log.slog.Handler;

}