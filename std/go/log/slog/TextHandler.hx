package go.log.slog;

/**
    TextHandler is a [Handler] that writes Records to an [io.Writer] as a
    sequence of key=value pairs separated by spaces and followed by a newline.
**/
@:structInit
@:go.Type({ name: "TextHandler", instanceName: "slog.TextHandler", imports: ["log/slog"] })
extern class TextHandler {

    /**
        Enabled reports whether the handler handles records at the given level.
        The handler ignores records whose level is lower.
    **/
    @:native("Enabled") function enabled(_: go.context.Context, level: go.log.slog.Level): (Bool);
    /**
        Handle formats its argument [Record] as a single line of space-separated
        key=value items.
        
        If the Record's time is zero, the time is omitted.
        Otherwise, the key is "time"
        and the value is output in RFC3339 format with millisecond precision.
        
        The level's key is "level" and its value is the result of calling [Level.String].
        
        If the AddSource option is set and source information is available,
        the key is "source" and the value is output as FILE:LINE.
        
        The message's key is "msg".
        
        To modify these or other attributes, or remove them from the output, use
        [HandlerOptions.ReplaceAttr].
        
        If a value implements [encoding.TextMarshaler], the result of MarshalText is
        written. Otherwise, the result of [fmt.Sprint] is written.
        
        Keys and values are quoted with [strconv.Quote] if they contain Unicode space
        characters, non-printing characters, '"' or '='.
        
        Keys inside groups consist of components (keys or group names) separated by
        dots. No further escaping is performed.
        Thus there is no way to determine from the key "a.b.c" whether there
        are two groups "a" and "b" and a key "c", or a single group "a.b" and a key "c",
        or single group "a" and a key "b.c".
        If it is necessary to reconstruct the group structure of a key
        even in the presence of dots inside components, use
        [HandlerOptions.ReplaceAttr] to encode that information in the key.
        
        Each call to Handle results in a single serialized call to
        io.Writer.Write.
    **/
    @:native("Handle") function handle(_: go.context.Context, r: go.log.slog.Record): (go.Error);
    /**
        WithAttrs returns a new [TextHandler] whose attributes consists
        of h's attributes followed by attrs.
    **/
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): (go.log.slog.Handler);
    @:native("WithGroup") function withGroup(name: std.String): (go.log.slog.Handler);

}