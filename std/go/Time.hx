package go;

@:go.Type({ name: "time", instanceName: "time.time", imports: ["time"] })
extern class Time {

    @:native("ANSIC") static var ANSIC: String;
    @:native("April") static var april: go.time.Month;
    @:native("August") static var august: go.time.Month;
    @:native("DateOnly") static var dateOnly: String;
    @:native("DateTime") static var dateTime: String;
    @:native("December") static var december: go.time.Month;
    @:native("February") static var february: go.time.Month;
    @:native("Friday") static var friday: go.time.Weekday;
    @:native("Hour") static var hour: go.time.Duration;
    @:native("January") static var january: go.time.Month;
    @:native("July") static var july: go.time.Month;
    @:native("June") static var june: go.time.Month;
    @:native("Kitchen") static var kitchen: String;
    @:native("Layout") static var layout: String;
    @:native("March") static var march: go.time.Month;
    @:native("May") static var may: go.time.Month;
    @:native("Microsecond") static var microsecond: go.time.Duration;
    @:native("Millisecond") static var millisecond: go.time.Duration;
    @:native("Minute") static var minute: go.time.Duration;
    @:native("Monday") static var monday: go.time.Weekday;
    @:native("Nanosecond") static var nanosecond: go.time.Duration;
    @:native("November") static var november: go.time.Month;
    @:native("October") static var october: go.time.Month;
    @:native("RFC1123") static var RFC1123: String;
    @:native("RFC1123Z") static var RFC1123Z: String;
    @:native("RFC3339") static var RFC3339: String;
    @:native("RFC3339Nano") static var rFC3339Nano: String;
    @:native("RFC822") static var RFC822: String;
    @:native("RFC822Z") static var RFC822Z: String;
    @:native("RFC850") static var RFC850: String;
    @:native("RubyDate") static var rubyDate: String;
    @:native("Saturday") static var saturday: go.time.Weekday;
    @:native("Second") static var second: go.time.Duration;
    @:native("September") static var september: go.time.Month;
    @:native("Stamp") static var stamp: String;
    @:native("StampMicro") static var stampMicro: String;
    @:native("StampMilli") static var stampMilli: String;
    @:native("StampNano") static var stampNano: String;
    @:native("Sunday") static var sunday: go.time.Weekday;
    @:native("Thursday") static var thursday: go.time.Weekday;
    @:native("TimeOnly") static var timeOnly: String;
    @:native("Tuesday") static var tuesday: go.time.Weekday;
    @:native("UnixDate") static var unixDate: String;
    @:native("Wednesday") static var wednesday: go.time.Weekday;

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