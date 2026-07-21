package go.time;

@:structInit
@:go.Type({ name: "Time", instanceName: "time.Time", imports: ["time"] })
extern class Time {

    @:native("Add") function add(d: go.time.Duration): (go.time.Time);
    @:native("AddDate") function addDate(years: go.GoInt, months: go.GoInt, days: go.GoInt): (go.time.Time);
    @:native("After") function after(u: go.time.Time): (Bool);
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("AppendFormat") function appendFormat(b: go.Slice<go.Byte>, layout: String): (go.Slice<go.Byte>);
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Before") function before(u: go.time.Time): (Bool);
    @:go.Tuple("hour", "min", "sec") @:native("Clock") function clock(): (go.Tuple<{ hour: go.GoInt, min: go.GoInt, sec: go.GoInt }>);
    @:native("Compare") function compare(u: go.time.Time): (go.GoInt);
    @:go.Tuple("year", "month", "day") @:native("Date") function date(): (go.Tuple<{ year: go.GoInt, month: go.time.Month, day: go.GoInt }>);
    @:native("Day") function day(): (go.GoInt);
    @:native("Equal") function equal(u: go.time.Time): (Bool);
    @:native("Format") function format(layout: String): (String);
    @:native("GoString") function goString(): (String);
    @:native("GobDecode") function gobDecode(data: go.Slice<go.Byte>): (go.Error);
    @:native("GobEncode") function gobEncode(): (go.Result<go.Slice<go.Byte>>);
    @:native("Hour") function hour(): (go.GoInt);
    @:go.Tuple("year", "week") @:native("ISOWeek") function iSOWeek(): (go.Tuple<{ year: go.GoInt, week: go.GoInt }>);
    @:native("In") function _in(loc: go.Pointer<go.time.Location>): (go.time.Time);
    @:native("IsDST") function isDST(): (Bool);
    @:native("IsZero") function isZero(): (Bool);
    @:native("Local") function local(): (go.time.Time);
    @:native("Location") function location(): (go.Pointer<go.time.Location>);
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    @:native("Minute") function minute(): (go.GoInt);
    @:native("Month") function month(): (go.time.Month);
    @:native("Nanosecond") function nanosecond(): (go.GoInt);
    @:native("Round") function round(d: go.time.Duration): (go.time.Time);
    @:native("Second") function second(): (go.GoInt);
    @:native("String") function string(): (String);
    @:native("Sub") function sub(u: go.time.Time): (go.time.Duration);
    @:native("Truncate") function truncate(d: go.time.Duration): (go.time.Time);
    @:native("UTC") function UTC(): (go.time.Time);
    @:native("Unix") function unix(): (go.Int64);
    @:native("UnixMicro") function unixMicro(): (go.Int64);
    @:native("UnixMilli") function unixMilli(): (go.Int64);
    @:native("UnixNano") function unixNano(): (go.Int64);
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): (go.Error);
    @:native("UnmarshalJSON") function unmarshalJSON(data: go.Slice<go.Byte>): (go.Error);
    @:native("UnmarshalText") function unmarshalText(data: go.Slice<go.Byte>): (go.Error);
    @:native("Weekday") function weekday(): (go.time.Weekday);
    @:native("Year") function year(): (go.GoInt);
    @:native("YearDay") function yearDay(): (go.GoInt);
    @:go.Tuple("name", "offset") @:native("Zone") function zone(): (go.Tuple<{ name: String, offset: go.GoInt }>);
    @:go.Tuple("start", "end") @:native("ZoneBounds") function zoneBounds(): (go.Tuple<{ start: go.time.Time, end: go.time.Time }>);

}