package go.time;

@:go.Type({ name: "time", imports: ["time"] })
extern class Time {

    static var nanosecond: Duration;
    static var microsecond: Duration;
    static var millisecond: Duration;
    static var second: Duration;
    static var minute: Duration;
    static var hour: Duration;

    static function now(): Time;
    static function sleep(d: Duration): Void;

}
