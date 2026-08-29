package go.log.slog;

/**
    MultiHandler is a [Handler] that invokes all the given Handlers.
    Its Enabled method reports whether any of the handlers' Enabled methods return true.
    Its Handle, WithAttrs and WithGroup methods call the corresponding method on each of the enabled handlers.
**/
@:structInit
@:go.Type({ name: "MultiHandler", instanceName: "slog.MultiHandler", imports: ["log/slog"] })
extern class MultiHandler {

    @:native("Enabled") function enabled(ctx: go.context.Context, l: go.log.slog.Level): (Bool);
    @:native("Handle") function handle(ctx: go.context.Context, r: go.log.slog.Record): (go.Error);
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): (go.log.slog.Handler);
    @:native("WithGroup") function withGroup(name: std.String): (go.log.slog.Handler);

}