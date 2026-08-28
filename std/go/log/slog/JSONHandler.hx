package go.log.slog;

/**
    JSONHandler is a [Handler] that writes Records to an [io.Writer] as
    line-delimited JSON objects.
**/
@:structInit
@:go.Type({ name: "JSONHandler", instanceName: "slog.JSONHandler", imports: ["log/slog"] })
extern class JSONHandler {

    /**
        Enabled reports whether the handler handles records at the given level.
        The handler ignores records whose level is lower.
    **/
    @:native("Enabled") function enabled(_: go.context.Context, level: go.log.slog.Level): (Bool);
    /**
        Handle formats its argument [Record] as a JSON object on a single line.
        
        If the Record's time is zero, the time is omitted.
        Otherwise, the key is "time"
        and the value is output as with json.Marshal.
        
        The level's key is "level" and its value is the result of calling [Level.String].
        
        If the AddSource option is set and source information is available,
        the key is "source", and the value is a record of type [Source].
        
        The message's key is "msg".
        
        To modify these or other attributes, or remove them from the output, use
        [HandlerOptions.ReplaceAttr].
        
        Values are formatted as with an [encoding/json.Encoder] with SetEscapeHTML(false),
        with two exceptions.
        
        First, an Attr whose Value is of type error is formatted as a string, by
        calling its Error method. Only errors in Attrs receive this special treatment,
        not errors embedded in structs, slices, maps or other data structures that
        are processed by the [encoding/json] package.
        
        Second, an encoding failure does not cause Handle to return an error.
        Instead, the error message is formatted as a string.
        
        Each call to Handle results in a single serialized call to io.Writer.Write.
    **/
    @:native("Handle") function handle(_: go.context.Context, r: go.log.slog.Record): (go.Error);
    /**
        WithAttrs returns a new [JSONHandler] whose attributes consists
        of h's attributes followed by attrs.
    **/
    @:native("WithAttrs") function withAttrs(attrs: go.Slice<go.log.slog.Attr>): (go.log.slog.Handler);
    @:native("WithGroup") function withGroup(name: std.String): (go.log.slog.Handler);

}