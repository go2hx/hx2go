package go.log.slog;

@:go.Type({ name: "Level", instanceName: "slog.Level", imports: ["log/slog"] })
extern typedef Level = haxe.extern.EitherType<go.GoInt, {
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Level") function level(): (go.log.slog.Level);
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    @:native("String") function string(): (String);
    @:native("UnmarshalJSON") function unmarshalJSON(data: go.Slice<go.Byte>): (go.Error);
    @:native("UnmarshalText") function unmarshalText(data: go.Slice<go.Byte>): (go.Error);

}>