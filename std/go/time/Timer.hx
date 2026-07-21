package go.time;

@:structInit
@:go.Type({ name: "Timer", instanceName: "time.Timer", imports: ["time"] })
extern class Timer {

    @:native("C") var C: go.Chan<go.time.Time>;

    function new(C: go.Chan<go.time.Time>);

    @:native("Reset") function reset(d: go.time.Duration): (Bool);
    @:native("Stop") function stop(): (Bool);

}