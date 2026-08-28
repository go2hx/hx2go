package go.log.slog;

/**
    Kind is the kind of a [Value].
**/
@:go.Type({ name: "Kind", instanceName: "slog.Kind", imports: ["log/slog"] })
extern typedef Kind = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (std.String);

}>