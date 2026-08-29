package go.time;

/**
    A Time represents an instant in time with nanosecond precision.
    
    Programs using times should typically store and pass them as values,
    not pointers. That is, time variables and struct fields should be of
    type [time.Time], not *time.Time.
    
    A Time value can be used by multiple goroutines simultaneously except
    that the methods [Time.GobDecode], [Time.UnmarshalBinary], [Time.UnmarshalJSON] and
    [Time.UnmarshalText] are not concurrency-safe.
    
    Time instants can be compared using the [Time.Before], [Time.After], and [Time.Equal] methods.
    The [Time.Sub] method subtracts two instants, producing a [Duration].
    The [Time.Add] method adds a Time and a Duration, producing a Time.
    
    The zero value of type Time is January 1, year 1, 00:00:00.000000000 UTC.
    As this time is unlikely to come up in practice, the [Time.IsZero] method gives
    a simple way of detecting a time that has not been initialized explicitly.
    
    Each time has an associated [Location]. The methods [Time.Local], [Time.UTC], and Time.In return a
    Time with a specific Location. Changing the Location of a Time value with
    these methods does not change the actual instant it represents, only the time
    zone in which to interpret it.
    
    Representations of a Time value saved by the [Time.GobEncode], [Time.MarshalBinary], [Time.AppendBinary],
    [Time.MarshalJSON], [Time.MarshalText] and [Time.AppendText] methods store the [Time.Location]'s offset,
    but not the location name. They therefore lose information about Daylight Saving Time.
    
    In addition to the required “wall clock” reading, a Time may contain an optional
    reading of the current process's monotonic clock, to provide additional precision
    for comparison or subtraction.
    See the “Monotonic Clocks” section in the package documentation for details.
    
    Note that the Go == operator compares not just the time instant but also the
    Location and the monotonic clock reading. Therefore, Time values should not
    be used as map or database keys without first guaranteeing that the
    identical Location has been set for all values, which can be achieved
    through use of the UTC or Local method, and that the monotonic clock reading
    has been stripped by setting t = t.Round(0). In general, prefer t.Equal(u)
    to t == u, since t.Equal uses the most accurate comparison available and
    correctly handles the case when only one of its arguments has a monotonic
    clock reading.
**/
@:structInit
@:go.Type({ name: "Time", instanceName: "time.Time", imports: ["time"] })
extern class Time {

    /**
        Add returns the time t+d.
    **/
    @:native("Add") function add(d: go.time.Duration): (go.time.Time);
    /**
        AddDate returns the time corresponding to adding the
        given number of years, months, and days to t.
        For example, AddDate(-1, 2, 3) applied to January 1, 2011
        returns March 4, 2010.
        
        Note that dates are fundamentally coupled to timezones, and calendrical
        periods like days don't have fixed durations. AddDate uses the Location of
        the Time value to determine these durations. That means that the same
        AddDate arguments can produce a different shift in absolute time depending on
        the base Time value and its Location. For example, AddDate(0, 0, 1) applied
        to 12:00 on March 27 always returns 12:00 on March 28. At some locations and
        in some years this is a 24 hour shift. In others it's a 23 hour shift due to
        daylight savings time transitions.
        
        AddDate normalizes its result in the same way that Date does,
        so, for example, adding one month to October 31 yields
        December 1, the normalized form for November 31.
    **/
    @:native("AddDate") function addDate(years: go.GoInt, months: go.GoInt, days: go.GoInt): (go.time.Time);
    /**
        After reports whether the time instant t is after u.
    **/
    @:native("After") function after(u: go.time.Time): (Bool);
    /**
        AppendBinary implements the [encoding.BinaryAppender] interface.
    **/
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        AppendFormat is like [Time.Format] but appends the textual
        representation to b and returns the extended buffer.
    **/
    @:native("AppendFormat") function appendFormat(b: go.Slice<go.Byte>, layout: String): (go.Slice<go.Byte>);
    /**
        AppendText implements the [encoding.TextAppender] interface.
        The time is formatted in RFC 3339 format with sub-second precision.
        If the timestamp cannot be represented as valid RFC 3339
        (e.g., the year is out of range), then an error is returned.
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        Before reports whether the time instant t is before u.
    **/
    @:native("Before") function before(u: go.time.Time): (Bool);
    /**
        Clock returns the hour, minute, and second within the day specified by t.
    **/
    @:go.Tuple("hour", "min", "sec") @:native("Clock") function clock(): (go.Tuple<{ hour: go.GoInt, min: go.GoInt, sec: go.GoInt }>);
    /**
        Compare compares the time instant t with u. If t is before u, it returns -1;
        if t is after u, it returns +1; if they're the same, it returns 0.
    **/
    @:native("Compare") function compare(u: go.time.Time): (go.GoInt);
    /**
        Date returns the year, month, and day in which t occurs.
    **/
    @:go.Tuple("year", "month", "day") @:native("Date") function date(): (go.Tuple<{ year: go.GoInt, month: go.time.Month, day: go.GoInt }>);
    /**
        Day returns the day of the month specified by t.
    **/
    @:native("Day") function day(): (go.GoInt);
    /**
        Equal reports whether t and u represent the same time instant.
        Two times can be equal even if they are in different locations.
        For example, 6:00 +0200 and 4:00 UTC are Equal.
        See the documentation on the Time type for the pitfalls of using == with
        Time values; most code should use Equal instead.
    **/
    @:native("Equal") function equal(u: go.time.Time): (Bool);
    /**
        Format returns a textual representation of the time value formatted according
        to the layout defined by the argument. See the documentation for the
        constant called [Layout] to see how to represent the layout format.
        
        The executable example for [Time.Format] demonstrates the working
        of the layout string in detail and is a good reference.
    **/
    @:native("Format") function format(layout: String): (String);
    /**
        GoString implements [fmt.GoStringer] and formats t to be printed in Go source
        code.
    **/
    @:native("GoString") function goString(): (String);
    /**
        GobDecode implements the gob.GobDecoder interface.
    **/
    @:native("GobDecode") function gobDecode(data: go.Slice<go.Byte>): (go.Error);
    /**
        GobEncode implements the gob.GobEncoder interface.
    **/
    @:native("GobEncode") function gobEncode(): (go.Result<go.Slice<go.Byte>>);
    /**
        Hour returns the hour within the day specified by t, in the range [0, 23].
    **/
    @:native("Hour") function hour(): (go.GoInt);
    /**
        ISOWeek returns the ISO 8601 year and week number in which t occurs.
        Week ranges from 1 to 53. Jan 01 to Jan 03 of year n might belong to
        week 52 or 53 of year n-1, and Dec 29 to Dec 31 might belong to week 1
        of year n+1.
    **/
    @:go.Tuple("year", "week") @:native("ISOWeek") function iSOWeek(): (go.Tuple<{ year: go.GoInt, week: go.GoInt }>);
    /**
        In returns a copy of t representing the same time instant, but
        with the copy's location information set to loc for display
        purposes.
        
        In panics if loc is nil.
    **/
    @:native("In") function _in(loc: go.Pointer<go.time.Location>): (go.time.Time);
    /**
        IsDST reports whether the time in the configured location is in Daylight Savings Time.
    **/
    @:native("IsDST") function isDST(): (Bool);
    /**
        IsZero reports whether t represents the zero time instant,
        January 1, year 1, 00:00:00 UTC.
    **/
    @:native("IsZero") function isZero(): (Bool);
    /**
        Local returns t with the location set to local time.
    **/
    @:native("Local") function local(): (go.time.Time);
    /**
        Location returns the time zone information associated with t.
    **/
    @:native("Location") function location(): (go.Pointer<go.time.Location>);
    /**
        MarshalBinary implements the [encoding.BinaryMarshaler] interface.
    **/
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalJSON implements the [encoding/json.Marshaler] interface.
        The time is a quoted string in the RFC 3339 format with sub-second precision.
        If the timestamp cannot be represented as valid RFC 3339
        (e.g., the year is out of range), then an error is reported.
    **/
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalText implements the [encoding.TextMarshaler] interface. The output
        matches that of calling the [Time.AppendText] method.
        
        See [Time.AppendText] for more information.
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        Minute returns the minute offset within the hour specified by t, in the range [0, 59].
    **/
    @:native("Minute") function minute(): (go.GoInt);
    /**
        Month returns the month of the year specified by t.
    **/
    @:native("Month") function month(): (go.time.Month);
    /**
        Nanosecond returns the nanosecond offset within the second specified by t,
        in the range [0, 999999999].
    **/
    @:native("Nanosecond") function nanosecond(): (go.GoInt);
    /**
        Round returns the result of rounding t to the nearest multiple of d (since the zero time).
        The rounding behavior for halfway values is to round up.
        If d <= 0, Round returns t stripped of any monotonic clock reading but otherwise unchanged.
        
        Round operates on the time as an absolute duration since the
        zero time; it does not operate on the presentation form of the
        time. Thus, Round(Hour) may return a time with a non-zero
        minute, depending on the time's Location.
    **/
    @:native("Round") function round(d: go.time.Duration): (go.time.Time);
    /**
        Second returns the second offset within the minute specified by t, in the range [0, 59].
    **/
    @:native("Second") function second(): (go.GoInt);
    /**
        String returns the time formatted using the format string
        
        	"2006-01-02 15:04:05.999999999 -0700 MST"
        
        If the time has a monotonic clock reading, the returned string
        includes a final field "m=±<value>", where value is the monotonic
        clock reading formatted as a decimal number of seconds.
        
        The returned string is meant for debugging; for a stable serialized
        representation, use t.MarshalText, t.MarshalBinary, or t.Format
        with an explicit format string.
    **/
    @:native("String") function string(): (String);
    /**
        Sub returns the duration t-u. If the result exceeds the maximum (or minimum)
        value that can be stored in a [Duration], the maximum (or minimum) duration
        will be returned.
        To compute t-d for a duration d, use t.Add(-d).
    **/
    @:native("Sub") function sub(u: go.time.Time): (go.time.Duration);
    /**
        Truncate returns the result of rounding t down to a multiple of d (since the zero time).
        If d <= 0, Truncate returns t stripped of any monotonic clock reading but otherwise unchanged.
        
        Truncate operates on the time as an absolute duration since the
        zero time; it does not operate on the presentation form of the
        time. Thus, Truncate(Hour) may return a time with a non-zero
        minute, depending on the time's Location.
    **/
    @:native("Truncate") function truncate(d: go.time.Duration): (go.time.Time);
    /**
        UTC returns t with the location set to UTC.
    **/
    @:native("UTC") function UTC(): (go.time.Time);
    /**
        Unix returns t as a Unix time, the number of seconds elapsed
        since January 1, 1970 UTC. The result does not depend on the
        location associated with t.
        Unix-like operating systems often record time as a 32-bit
        count of seconds, but since the method here returns a 64-bit
        value it is valid for billions of years into the past or future.
    **/
    @:native("Unix") function unix(): (go.Int64);
    /**
        UnixMicro returns t as a Unix time, the number of microseconds elapsed since
        January 1, 1970 UTC. The result is undefined if the Unix time in
        microseconds cannot be represented by an int64 (a date before year -290307 or
        after year 294246). The result does not depend on the location associated
        with t.
    **/
    @:native("UnixMicro") function unixMicro(): (go.Int64);
    /**
        UnixMilli returns t as a Unix time, the number of milliseconds elapsed since
        January 1, 1970 UTC. The result is undefined if the Unix time in
        milliseconds cannot be represented by an int64 (a date more than 292 million
        years before or after 1970). The result does not depend on the
        location associated with t.
    **/
    @:native("UnixMilli") function unixMilli(): (go.Int64);
    /**
        UnixNano returns t as a Unix time, the number of nanoseconds elapsed
        since January 1, 1970 UTC. The result is undefined if the Unix time
        in nanoseconds cannot be represented by an int64 (a date before the year
        1678 or after 2262). Note that this means the result of calling UnixNano
        on the zero Time is undefined. The result does not depend on the
        location associated with t.
    **/
    @:native("UnixNano") function unixNano(): (go.Int64);
    /**
        UnmarshalBinary implements the [encoding.BinaryUnmarshaler] interface.
    **/
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): (go.Error);
    /**
        UnmarshalJSON implements the [encoding/json.Unmarshaler] interface.
        The time must be a quoted string in the RFC 3339 format.
    **/
    @:native("UnmarshalJSON") function unmarshalJSON(data: go.Slice<go.Byte>): (go.Error);
    /**
        UnmarshalText implements the [encoding.TextUnmarshaler] interface.
        The time must be in the RFC 3339 format.
    **/
    @:native("UnmarshalText") function unmarshalText(data: go.Slice<go.Byte>): (go.Error);
    /**
        Weekday returns the day of the week specified by t.
    **/
    @:native("Weekday") function weekday(): (go.time.Weekday);
    /**
        Year returns the year in which t occurs.
    **/
    @:native("Year") function year(): (go.GoInt);
    /**
        YearDay returns the day of the year specified by t, in the range [1,365] for non-leap years,
        and [1,366] in leap years.
    **/
    @:native("YearDay") function yearDay(): (go.GoInt);
    /**
        Zone computes the time zone in effect at time t, returning the abbreviated
        name of the zone (such as "CET") and its offset in seconds east of UTC.
    **/
    @:go.Tuple("name", "offset") @:native("Zone") function zone(): (go.Tuple<{ name: String, offset: go.GoInt }>);
    /**
        ZoneBounds returns the bounds of the time zone in effect at time t.
        The zone begins at start and the next zone begins at end.
        If the zone begins at the beginning of time, start will be returned as a zero Time.
        If the zone goes on forever, end will be returned as a zero Time.
        The Location of the returned times will be the same as t.
    **/
    @:go.Tuple("start", "end") @:native("ZoneBounds") function zoneBounds(): (go.Tuple<{ start: go.time.Time, end: go.time.Time }>);

}