package go.log.slog;

/**
    A Level is the importance or severity of a log event.
    The higher the level, the more important or severe the event.
**/
@:go.Type({ name: "Level", instanceName: "slog.Level", imports: ["log/slog"] })
extern typedef Level = haxe.extern.EitherType<go.GoInt, {
    /**
        AppendText implements [encoding.TextAppender]
        by calling [Level.String].
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        Level returns the receiver.
        It implements [Leveler].
    **/
    @:native("Level") function level(): (go.log.slog.Level);
    /**
        MarshalJSON implements [encoding/json.Marshaler]
        by quoting the output of [Level.String].
    **/
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalText implements [encoding.TextMarshaler]
        by calling [Level.AppendText].
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        String returns a name for the level.
        If the level has a name, then that name
        in uppercase is returned.
        If the level is between named values, then
        an integer is appended to the uppercased name.
        Examples:
        
        	LevelWarn.String() => "WARN"
        	(LevelInfo+2).String() => "INFO+2"
    **/
    @:native("String") function string(): (std.String);
    /**
        UnmarshalJSON implements [encoding/json.Unmarshaler]
        It accepts any string produced by [Level.MarshalJSON],
        ignoring case.
        It also accepts numeric offsets that would result in a different string on
        output. For example, "Error-8" would marshal as "INFO".
    **/
    @:native("UnmarshalJSON") function unmarshalJSON(data: go.Slice<go.Byte>): (go.Error);
    /**
        UnmarshalText implements [encoding.TextUnmarshaler].
        It accepts any string produced by [Level.MarshalText],
        ignoring case.
        It also accepts numeric offsets that would result in a different string on
        output. For example, "Error-8" would marshal as "INFO".
    **/
    @:native("UnmarshalText") function unmarshalText(data: go.Slice<go.Byte>): (go.Error);

}>