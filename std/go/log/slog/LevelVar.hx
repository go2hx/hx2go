package go.log.slog;

@:structInit
@:go.Type({ name: "LevelVar", instanceName: "slog.LevelVar", imports: ["log/slog"] })
extern class LevelVar {

    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Level") function level(): go.log.slog.Level;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("Set") function set(l: go.log.slog.Level): Void;
    @:native("String") function string(): String;
    @:native("UnmarshalText") function unmarshalText(data: go.Slice<go.Byte>): go.Error;

}