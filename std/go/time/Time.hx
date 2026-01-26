package go.time;

@:go.TypeAccess({ name: "time", imports: ["time"] })
extern class Time {

    static var millisecond: Duration;
    static var second: Duration;

    static function sleep(d: Duration): Void;
    static function since(t: Time): Duration;
    static function now(): Time;

}
