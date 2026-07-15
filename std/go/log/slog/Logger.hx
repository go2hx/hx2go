package go.log.slog;

@:structInit
@:go.Type({ name: "Logger", instanceName: "slog.Logger", imports: ["log/slog"] })
extern class Logger {

    @:native("Debug") function debug(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("DebugContext") function debugContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Enabled") function enabled(ctx: go.context.Context, level: go.log.slog.Level): Bool;
    @:native("Error") function error(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("ErrorContext") function errorContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Handler") function handler(): go.log.slog.Handler;
    @:native("Info") function info(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("InfoContext") function infoContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Log") function log(ctx: go.context.Context, level: go.log.slog.Level, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("LogAttrs") function logAttrs(ctx: go.context.Context, level: go.log.slog.Level, msg: String, attrs: haxe.Rest<go.log.slog.Attr>): Void;
    @:native("Warn") function warn(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("WarnContext") function warnContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("With") function with(args: haxe.Rest<Dynamic>): go.Pointer<go.log.slog.Logger>;
    @:native("WithGroup") function withGroup(name: String): go.Pointer<go.log.slog.Logger>;

}