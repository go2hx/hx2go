package go.time;

@:go.TypeAccess({ name: "time", imports: ["time"] })
extern class Time {

    // TODO: this extern is incomplete - https://pkg.go.dev/time

    static var millisecond: Duration;
    static var second: Duration;

    static function sleep(d: Duration): Void;
    @:pure static function since(t: Time): Duration;
    @:pure static function duration(v: Any): Duration;
    @:pure static function now(): Time;

}
