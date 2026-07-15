package go.log.slog;

@:structInit
@:go.Type({ name: "JSONHandler", instanceName: "slog.JSONHandler", imports: ["log/slog"] })
extern class JSONHandler {

    @:native("Enabled") function enabled(_: go.context.Context, level: go.log.slog.Level): Bool;
    @:native("Handle") function handle(_: go.context.Context, r: go.log.slog.Record): go.Error;
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): go.log.slog.Handler;
    @:native("WithGroup") function withGroup(name: String): go.log.slog.Handler;

}