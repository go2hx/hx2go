package go.time;

@:structInit
@:go.Type({ name: "Ticker", instanceName: "time.Ticker", imports: ["time"] })
extern class Ticker {

    @:native("C") var C: go.Chan<go.time.Time>;

    function new(C: go.Chan<go.time.Time>);

    @:native("Reset") function reset(d: go.time.Duration): Void;
    @:native("Stop") function stop(): Void;

}