package go.log.slog;

/**
    A LevelVar is a [Level] variable, to allow a [Handler] level to change
    dynamically.
    It implements [Leveler] as well as a Set method,
    and it is safe for use by multiple goroutines.
    The zero LevelVar corresponds to [LevelInfo].
**/
@:structInit
@:go.Type({ name: "LevelVar", instanceName: "slog.LevelVar", imports: ["log/slog"] })
extern class LevelVar {

    /**
        AppendText implements [encoding.TextAppender]
        by calling [Level.AppendText].
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        Level returns v's level.
    **/
    @:native("Level") function level(): (go.log.slog.Level);
    /**
        MarshalText implements [encoding.TextMarshaler]
        by calling [LevelVar.AppendText].
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        Set sets v's level to l.
    **/
    @:native("Set") function set(l: go.log.slog.Level): Void;
    @:native("String") function string(): (std.String);
    /**
        UnmarshalText implements [encoding.TextUnmarshaler]
        by calling [Level.UnmarshalText].
    **/
    @:native("UnmarshalText") function unmarshalText(data: go.Slice<go.Byte>): (go.Error);

}