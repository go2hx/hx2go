package go.time;

@:go.Type({ name: "time", instanceName: "time.Time", imports: ["time"] })
extern class Time {

    static var nanosecond: Duration;
    static var microsecond: Duration;
    static var millisecond: Duration;
    static var second: Duration;
    static var minute: Duration;
    static var hour: Duration;
    @:native("Local") static var localPtr: Pointer<Location>;

    static function now(): Time;
    static function sleep(d: Duration): Void;
    static function loadLocation(name: String): Result<Pointer<Location>>;

    function unix(): Int64;
    function unixMilli(): Int64;
    function unixMicro(): Int64;
    function unixNano(): Int64;
    function local(): Time;
    @:go.Tuple("name", "offset") public function zone(): Tuple<{ name:String, offset:Int }>;

}
