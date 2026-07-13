package go.time;

@:go.Type({ name: "time", instanceName: "time.Time", imports: ["time"] })
extern class Time {

    static var nanosecond: Duration;
    static var microsecond: Duration;
    static var millisecond: Duration;
    static var second: Duration;
    static var local: Pointer<Location>;
    static var minute: Duration;
    static var hour: Duration;
    @:native("Local") static var localPtr: Pointer<Location>;

    static function now(): Time;
    static function parse(layout: String, value:String): Result<Time>;
    static function unixMicro(usec: Int64): Time;
    static function unixMilli(msec: Int64): Time;
    static function unix(sec: Int64, nsec: Int64): Time;
    static function date(year: Int, month: Month, day: Int, hour: Int, min: Int, sec: Int, nsec: Int, loc: Pointer<Location>): Time;
    static function sleep(d: Duration): Void;
    static function loadLocation(name: String): Result<Pointer<Location>>;

    function unix(): Int64;
    function unixMilli(): Int64;
    function unixMicro(): Int64;
    function unixNano(): Int64;
    function local(): Time;
    function string(): String;
    @:native("uTC")
    function utc(): Time;

    function year(): Int;
    function month(): Month;
    function day(): Int;
    function hour(): Int;
    function minute(): Int;
    function second(): Int;

    @:go.Tuple("name", "offset") public function zone(): Tuple<{ name:String, offset:Int }>;
}