package go;

@:go.Type({ name: "time", instanceName: "time.time", imports: ["time"] })
extern class Time {

    @:native("ANSIC") static var ANSIC: String;
    @:native("April") static var April: go.time.Month;
    @:native("August") static var August: go.time.Month;
    @:native("DateOnly") static var DateOnly: String;
    @:native("DateTime") static var DateTime: String;
    @:native("December") static var December: go.time.Month;
    @:native("February") static var February: go.time.Month;
    @:native("Friday") static var Friday: go.time.Weekday;
    @:native("Hour") static var Hour: go.time.Duration;
    @:native("January") static var January: go.time.Month;
    @:native("July") static var July: go.time.Month;
    @:native("June") static var June: go.time.Month;
    @:native("Kitchen") static var Kitchen: String;
    @:native("Layout") static var Layout: String;
    @:native("March") static var March: go.time.Month;
    @:native("May") static var May: go.time.Month;
    @:native("Microsecond") static var Microsecond: go.time.Duration;
    @:native("Millisecond") static var Millisecond: go.time.Duration;
    @:native("Minute") static var Minute: go.time.Duration;
    @:native("Monday") static var Monday: go.time.Weekday;
    @:native("Nanosecond") static var Nanosecond: go.time.Duration;
    @:native("November") static var November: go.time.Month;
    @:native("October") static var October: go.time.Month;
    @:native("RFC1123") static var RFC1123: String;
    @:native("RFC1123Z") static var RFC1123Z: String;
    @:native("RFC3339") static var RFC3339: String;
    @:native("RFC3339Nano") static var RFC3339Nano: String;
    @:native("RFC822") static var RFC822: String;
    @:native("RFC822Z") static var RFC822Z: String;
    @:native("RFC850") static var RFC850: String;
    @:native("RubyDate") static var RubyDate: String;
    @:native("Saturday") static var Saturday: go.time.Weekday;
    @:native("Second") static var Second: go.time.Duration;
    @:native("September") static var September: go.time.Month;
    @:native("Stamp") static var Stamp: String;
    @:native("StampMicro") static var StampMicro: String;
    @:native("StampMilli") static var StampMilli: String;
    @:native("StampNano") static var StampNano: String;
    @:native("Sunday") static var Sunday: go.time.Weekday;
    @:native("Thursday") static var Thursday: go.time.Weekday;
    @:native("TimeOnly") static var TimeOnly: String;
    @:native("Tuesday") static var Tuesday: go.time.Weekday;
    @:native("UnixDate") static var UnixDate: String;
    @:native("Wednesday") static var Wednesday: go.time.Weekday;

    @:native("Local") static var local: go.Pointer<go.time.Location>;
    @:native("UTC") static var UTC: go.Pointer<go.time.Location>;

    @:native("After") static function after(d: go.time.Duration): (go.Chan<go.time.Time>);
    @:native("AfterFunc") static function afterFunc(d: go.time.Duration, f: () -> Void): (go.Pointer<go.time.Timer>);
    @:native("Date") static function date(year: go.GoInt, month: go.time.Month, day: go.GoInt, hour: go.GoInt, min: go.GoInt, sec: go.GoInt, nsec: go.GoInt, loc: go.Pointer<go.time.Location>): (go.time.Time);
    @:native("FixedZone") static function fixedZone(name: String, offset: go.GoInt): (go.Pointer<go.time.Location>);
    @:native("LoadLocation") static function loadLocation(name: String): (go.Result<go.Pointer<go.time.Location>>);
    @:native("LoadLocationFromTZData") static function loadLocationFromTZData(name: String, data: go.Slice<go.Byte>): (go.Result<go.Pointer<go.time.Location>>);
    @:native("NewTicker") static function newTicker(d: go.time.Duration): (go.Pointer<go.time.Ticker>);
    @:native("NewTimer") static function newTimer(d: go.time.Duration): (go.Pointer<go.time.Timer>);
    @:native("Now") static function now(): (go.time.Time);
    @:native("Parse") static function parse(layout: String, value: String): (go.Result<go.time.Time>);
    @:native("ParseDuration") static function parseDuration(s: String): (go.Result<go.time.Duration>);
    @:native("ParseInLocation") static function parseInLocation(layout: String, value: String, loc: go.Pointer<go.time.Location>): (go.Result<go.time.Time>);
    @:native("Since") static function since(t: go.time.Time): (go.time.Duration);
    @:native("Sleep") static function sleep(d: go.time.Duration): Void;
    @:native("Tick") static function tick(d: go.time.Duration): (go.Chan<go.time.Time>);
    @:native("Unix") static function unix(sec: go.Int64, nsec: go.Int64): (go.time.Time);
    @:native("UnixMicro") static function unixMicro(usec: go.Int64): (go.time.Time);
    @:native("UnixMilli") static function unixMilli(msec: go.Int64): (go.time.Time);
    @:native("Until") static function until(t: go.time.Time): (go.time.Duration);

}