package go.log.slog;

/**
    A Logger records structured information about each call to its
    Log, Debug, Info, Warn, and Error methods.
    For each call, it creates a [Record] and passes it to a [Handler].
    
    To create a new Logger, call [New] or a Logger method
    that begins "With".
**/
@:structInit
@:go.Type({ name: "Logger", instanceName: "slog.Logger", imports: ["log/slog"] })
extern class Logger {

    /**
        Debug logs at [LevelDebug].
    **/
    @:native("Debug") function debug(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        DebugContext logs at [LevelDebug] with the given context.
    **/
    @:native("DebugContext") function debugContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        Enabled reports whether l emits log records at the given context and level.
    **/
    @:native("Enabled") function enabled(ctx: go.context.Context, level: go.log.slog.Level): (Bool);
    /**
        Error logs at [LevelError].
    **/
    @:native("Error") function error(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        ErrorContext logs at [LevelError] with the given context.
    **/
    @:native("ErrorContext") function errorContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        Handler returns l's Handler.
    **/
    @:native("Handler") function handler(): (go.log.slog.Handler);
    /**
        Info logs at [LevelInfo].
    **/
    @:native("Info") function info(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        InfoContext logs at [LevelInfo] with the given context.
    **/
    @:native("InfoContext") function infoContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        Log emits a log record with the current time and the given level and message.
        The Record's Attrs consist of the Logger's attributes followed by
        the Attrs specified by args.
        
        The attribute arguments are processed as follows:
          - If an argument is an Attr, it is used as is.
          - If an argument is a string and this is not the last argument,
            the following argument is treated as the value and the two are combined
            into an Attr.
          - Otherwise, the argument is treated as a value with key "!BADKEY".
    **/
    @:native("Log") function log(ctx: go.context.Context, level: go.log.slog.Level, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        LogAttrs is a more efficient version of [Logger.Log] that accepts only Attrs.
    **/
    @:native("LogAttrs") function logAttrs(ctx: go.context.Context, level: go.log.slog.Level, msg: std.String, attrs: haxe.Rest<go.log.slog.Attr>): Void;
    /**
        Warn logs at [LevelWarn].
    **/
    @:native("Warn") function warn(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        WarnContext logs at [LevelWarn] with the given context.
    **/
    @:native("WarnContext") function warnContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        With returns a Logger that includes the given attributes
        in each output operation. Arguments are converted to
        attributes as if by [Logger.Log].
    **/
    @:native("With") function with(args: haxe.Rest<Dynamic>): (go.Pointer<go.log.slog.Logger>);
    /**
        WithGroup returns a Logger that starts a group, if name is non-empty.
        The keys of all attributes added to the Logger will be qualified by the given
        name. (How that qualification happens depends on the [Handler.WithGroup]
        method of the Logger's Handler.)
        
        If name is empty, WithGroup returns the receiver.
    **/
    @:native("WithGroup") function withGroup(name: std.String): (go.Pointer<go.log.slog.Logger>);

}