package go.log.slog;

@:structInit
@:go.Type({ name: "discardHandler", instanceName: "slog.discardHandler", imports: ["log/slog"] })
extern class DiscardHandler_ {

    @:native("Enabled") function enabled(p0: go.context.Context, p1: go.log.slog.Level): (Bool);
    @:native("Handle") function handle(p0: go.context.Context, p1: go.log.slog.Record): (go.Error);
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): (go.log.slog.Handler);
    @:native("WithGroup") function withGroup(name: String): (go.log.slog.Handler);

}