package go.log.slog;

/**
    HandlerOptions are options for a [TextHandler] or [JSONHandler].
    A zero HandlerOptions consists entirely of default values.
**/
@:structInit
@:go.Type({ name: "HandlerOptions", instanceName: "slog.HandlerOptions", imports: ["log/slog"] })
extern class HandlerOptions {

    @:native("AddSource") var addSource: Bool;
    @:native("Level") var level: go.log.slog.Leveler;
    @:native("ReplaceAttr") var replaceAttr: (groups: go.Slice<std.String>, a: go.log.slog.Attr) -> (go.log.slog.Attr);

    function new(addSource: Bool=false, level: go.log.slog.Leveler=null, replaceAttr: (groups: go.Slice<std.String>, a: go.log.slog.Attr) -> (go.log.slog.Attr)=null);

}