package go.log.slog;

@:structInit
@:go.Type({ name: "defaultHandler", instanceName: "slog.defaultHandler", imports: ["log/slog"] })
extern class DefaultHandler {

    @:native("Enabled") function enabled(_: go.context.Context, l: go.log.slog.Level): (Bool);
    @:native("Handle") function handle(ctx: go.context.Context, r: go.log.slog.Record): (go.Error);
    @:native("WithAttrs") function withAttrs(as: go.Slice<go.log.slog.Attr>): (go.log.slog.Handler);
    @:native("WithGroup") function withGroup(name: std.String): (go.log.slog.Handler);

}