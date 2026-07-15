package go.log;

@:go.Type({ name: "slog", instanceName: "slog.slog", imports: ["log/slog"] })
extern class Slog {

    @:native("KindAny") static var KindAny: go.log.slog.Kind;
    @:native("KindBool") static var KindBool: go.log.slog.Kind;
    @:native("KindDuration") static var KindDuration: go.log.slog.Kind;
    @:native("KindFloat64") static var KindFloat64: go.log.slog.Kind;
    @:native("KindGroup") static var KindGroup: go.log.slog.Kind;
    @:native("KindInt64") static var KindInt64: go.log.slog.Kind;
    @:native("KindLogValuer") static var KindLogValuer: go.log.slog.Kind;
    @:native("KindString") static var KindString: go.log.slog.Kind;
    @:native("KindTime") static var KindTime: go.log.slog.Kind;
    @:native("KindUint64") static var KindUint64: go.log.slog.Kind;
    @:native("LevelDebug") static var LevelDebug: go.log.slog.Level;
    @:native("LevelError") static var LevelError: go.log.slog.Level;
    @:native("LevelInfo") static var LevelInfo: go.log.slog.Level;
    @:native("LevelKey") static var LevelKey: String;
    @:native("LevelWarn") static var LevelWarn: go.log.slog.Level;
    @:native("MessageKey") static var MessageKey: String;
    @:native("SourceKey") static var SourceKey: String;
    @:native("TimeKey") static var TimeKey: String;

    @:native("DiscardHandler") static var DiscardHandler: go.log.slog.Handler;

    @:native("Any") static function any(key: String, value: Dynamic): go.log.slog.Attr;
    @:native("AnyValue") static function anyValue(v: Dynamic): go.log.slog.Value;
    @:native("Bool") static function bool(key: String, v: Bool): go.log.slog.Attr;
    @:native("BoolValue") static function boolValue(v: Bool): go.log.slog.Value;
    @:native("Debug") static function debug(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("DebugContext") static function debugContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Default") static function _default(): go.Pointer<go.log.slog.Logger>;
    @:native("Duration") static function duration(key: String, v: go.time.Duration): go.log.slog.Attr;
    @:native("DurationValue") static function durationValue(v: go.time.Duration): go.log.slog.Value;
    @:native("Error") static function error(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("ErrorContext") static function errorContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Float64") static function float64(key: String, v: Float): go.log.slog.Attr;
    @:native("Float64Value") static function float64Value(v: Float): go.log.slog.Value;
    @:native("Group") static function group(key: String, args: haxe.Rest<Dynamic>): go.log.slog.Attr;
    @:native("GroupAttrs") static function groupAttrs(key: String, attrs: haxe.Rest<go.log.slog.Attr>): go.log.slog.Attr;
    @:native("GroupValue") static function groupValue(as: haxe.Rest<go.log.slog.Attr>): go.log.slog.Value;
    @:native("Info") static function info(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("InfoContext") static function infoContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Int") static function int(key: String, value: go.GoInt): go.log.slog.Attr;
    @:native("Int64") static function int64(key: String, value: go.Int64): go.log.slog.Attr;
    @:native("Int64Value") static function int64Value(v: go.Int64): go.log.slog.Value;
    @:native("IntValue") static function intValue(v: go.GoInt): go.log.slog.Value;
    @:native("Log") static function log(ctx: go.context.Context, level: go.log.slog.Level, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("LogAttrs") static function logAttrs(ctx: go.context.Context, level: go.log.slog.Level, msg: String, attrs: haxe.Rest<go.log.slog.Attr>): Void;
    @:native("New") static function _new(h: go.log.slog.Handler): go.Pointer<go.log.slog.Logger>;
    @:native("NewJSONHandler") static function newJSONHandler(w: go.io.Writer, opts: go.Pointer<go.log.slog.HandlerOptions>): go.Pointer<go.log.slog.JSONHandler>;
    @:native("NewLogLogger") static function newLogLogger(h: go.log.slog.Handler, level: go.log.slog.Level): go.Pointer<go.log.Logger>;
    @:native("NewMultiHandler") static function newMultiHandler(handlers: haxe.Rest<go.log.slog.Handler>): go.Pointer<go.log.slog.MultiHandler>;
    @:native("NewRecord") static function newRecord(t: go.time.Time, level: go.log.slog.Level, msg: String, pc: go.UIntPtr): go.log.slog.Record;
    @:native("NewTextHandler") static function newTextHandler(w: go.io.Writer, opts: go.Pointer<go.log.slog.HandlerOptions>): go.Pointer<go.log.slog.TextHandler>;
    @:native("SetDefault") static function setDefault(l: go.Pointer<go.log.slog.Logger>): Void;
    @:native("SetLogLoggerLevel") static function setLogLoggerLevel(level: go.log.slog.Level): go.log.slog.Level;
    @:native("String") static function string(key: String, value: String): go.log.slog.Attr;
    @:native("StringValue") static function stringValue(value: String): go.log.slog.Value;
    @:native("Time") static function time(key: String, v: go.time.Time): go.log.slog.Attr;
    @:native("TimeValue") static function timeValue(v: go.time.Time): go.log.slog.Value;
    @:native("Uint64") static function uint64(key: String, v: go.UInt64): go.log.slog.Attr;
    @:native("Uint64Value") static function uint64Value(v: go.UInt64): go.log.slog.Value;
    @:native("Warn") static function warn(msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("WarnContext") static function warnContext(ctx: go.context.Context, msg: String, args: haxe.Rest<Dynamic>): Void;
    @:native("With") static function with(args: haxe.Rest<Dynamic>): go.Pointer<go.log.slog.Logger>;

}