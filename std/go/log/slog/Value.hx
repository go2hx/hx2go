package go.log.slog;

/**
    A Value can represent any Go value, but unlike type any,
    it can represent most small values without an allocation.
    The zero Value corresponds to nil.
**/
@:structInit
@:go.Type({ name: "Value", instanceName: "slog.Value", imports: ["log/slog"] })
extern class Value {

    /**
        Any returns v's value as an any.
    **/
    @:native("Any") function any(): (Dynamic);
    /**
        Bool returns v's value as a bool. It panics
        if v is not a bool.
    **/
    @:native("Bool") function bool(): (Bool);
    /**
        Duration returns v's value as a [time.Duration]. It panics
        if v is not a time.Duration.
    **/
    @:native("Duration") function duration(): (go.time.Duration);
    /**
        Equal reports whether v and w represent the same Go value.
    **/
    @:native("Equal") function equal(w: go.log.slog.Value): (Bool);
    /**
        Float64 returns v's value as a float64. It panics
        if v is not a float64.
    **/
    @:native("Float64") function float64(): (Float);
    /**
        Group returns v's value as a []Attr.
        It panics if v's [Kind] is not [KindGroup].
    **/
    @:native("Group") function group(): (go.Slice<go.log.slog.Attr>);
    /**
        Int64 returns v's value as an int64. It panics
        if v is not a signed integer.
    **/
    @:native("Int64") function int64(): (go.Int64);
    /**
        Kind returns v's Kind.
    **/
    @:native("Kind") function kind(): (go.log.slog.Kind);
    /**
        LogValuer returns v's value as a LogValuer. It panics
        if v is not a LogValuer.
    **/
    @:native("LogValuer") function logValuer(): (go.log.slog.LogValuer);
    /**
        Resolve repeatedly calls LogValue on v while it implements [LogValuer],
        and returns the result.
        If v resolves to a group, the group's attributes' values are not recursively
        resolved.
        If the number of LogValue calls exceeds a threshold, a Value containing an
        error is returned.
        Resolve's return value is guaranteed not to be of Kind [KindLogValuer].
    **/
    @:native("Resolve") function resolve(): (go.log.slog.Value);
    /**
        String returns Value's value as a string, formatted like [fmt.Sprint]. Unlike
        the methods Int64, Float64, and so on, which panic if v is of the
        wrong kind, String never panics.
    **/
    @:native("String") function string(): (std.String);
    /**
        Time returns v's value as a [time.Time]. It panics
        if v is not a time.Time.
    **/
    @:native("Time") function time(): (go.time.Time);
    /**
        Uint64 returns v's value as a uint64. It panics
        if v is not an unsigned integer.
    **/
    @:native("Uint64") function uint64(): (go.UInt64);

}