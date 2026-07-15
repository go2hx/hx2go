package go.log.slog;

@:structInit
@:go.Type({ name: "HandlerOptions", instanceName: "slog.HandlerOptions", imports: ["log/slog"] })
extern class HandlerOptions {

    @:native("AddSource") var addSource: Bool;
    @:native("Level") var level: go.log.slog.Leveler;
    @:native("ReplaceAttr") var replaceAttr: (groups: go.Slice<String>, a: go.log.slog.Attr) -> go.log.slog.Attr;

function new(addSource: Bool, level: go.log.slog.Leveler, replaceAttr: (groups: go.Slice<String>, a: go.log.slog.Attr) -> go.log.slog.Attr);

}