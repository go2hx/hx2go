package go.log.slog;

@:go.Type({ name: "Kind", instanceName: "slog.Kind", imports: ["log/slog"] })
extern typedef Kind = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>