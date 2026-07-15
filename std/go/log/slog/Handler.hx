package go.log.slog;

@:go.Type({ name: "Handler", instanceName: "slog.Handler", imports: ["log/slog"] })
extern typedef Handler = {

    @:native("Enabled") function enabled(p0: go.context.Context, p1: go.log.slog.Level): Bool;
    @:native("Handle") function handle(p0: go.context.Context, p1: go.log.slog.Record): go.Error;
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): go.log.slog.Handler;
    @:native("WithGroup") function withGroup(name: String): go.log.slog.Handler;

}