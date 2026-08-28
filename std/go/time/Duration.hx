package go.time;

/**
    A Duration represents the elapsed time between two instants
    as an int64 nanosecond count. The representation limits the
    largest representable duration to approximately 290 years.
**/
@:go.Type({ name: "Duration", instanceName: "time.Duration", imports: ["time"] })
extern typedef Duration = haxe.extern.EitherType<go.Int64, {
    /**
        Abs returns the absolute value of d.
        As a special case, Duration([math.MinInt64]) is converted to Duration([math.MaxInt64]),
        reducing its magnitude by 1 nanosecond.
    **/
    @:native("Abs") function abs(): (go.time.Duration);
    /**
        Hours returns the duration as a floating point number of hours.
    **/
    @:native("Hours") function hours(): (Float);
    /**
        Microseconds returns the duration as an integer microsecond count.
    **/
    @:native("Microseconds") function microseconds(): (go.Int64);
    /**
        Milliseconds returns the duration as an integer millisecond count.
    **/
    @:native("Milliseconds") function milliseconds(): (go.Int64);
    /**
        Minutes returns the duration as a floating point number of minutes.
    **/
    @:native("Minutes") function minutes(): (Float);
    /**
        Nanoseconds returns the duration as an integer nanosecond count.
    **/
    @:native("Nanoseconds") function nanoseconds(): (go.Int64);
    /**
        Round returns the result of rounding d to the nearest multiple of m.
        The rounding behavior for halfway values is to round away from zero.
        If the result exceeds the maximum (or minimum)
        value that can be stored in a [Duration],
        Round returns the maximum (or minimum) duration.
        If m <= 0, Round returns d unchanged.
    **/
    @:native("Round") function round(m: go.time.Duration): (go.time.Duration);
    /**
        Seconds returns the duration as a floating point number of seconds.
    **/
    @:native("Seconds") function seconds(): (Float);
    /**
        String returns a string representing the duration in the form "72h3m0.5s".
        Leading zero units are omitted. As a special case, durations less than one
        second format use a smaller unit (milli-, micro-, or nanoseconds) to ensure
        that the leading digit is non-zero. The zero duration formats as 0s.
    **/
    @:native("String") function string(): (String);
    /**
        Truncate returns the result of rounding d toward zero to a multiple of m.
        If m <= 0, Truncate returns d unchanged.
    **/
    @:native("Truncate") function truncate(m: go.time.Duration): (go.time.Duration);

}>