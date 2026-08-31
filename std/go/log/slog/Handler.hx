package go.log.slog;

/**
    A Handler handles log records produced by a Logger.
    
    A typical handler may print log records to standard error,
    or write them to a file or database, or perhaps augment them
    with additional attributes and pass them on to another handler.
    
    Any of the Handler's methods may be called concurrently with itself
    or with other methods. It is the responsibility of the Handler to
    manage this concurrency.
    
    Users of the slog package should not invoke Handler methods directly.
    They should use the methods of [Logger] instead.
    
    Before implementing your own handler, consult https://go.dev/s/slog-handler-guide.
**/
@:go.Type({ name: "Handler", instanceName: "slog.Handler", imports: ["log/slog"] })
extern typedef Handler = {

    @:native("Enabled") function enabled(p0: go.context.Context, p1: go.log.slog.Level): (Bool);
    @:native("Handle") function handle(p0: go.context.Context, p1: go.log.slog.Record): (go.Error);
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): (go.log.slog.Handler);
    @:native("WithGroup") function withGroup(name: std.String): (go.log.slog.Handler);

}