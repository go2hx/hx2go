package go.time;

/**
    A Ticker holds a channel that delivers “ticks” of a clock
    at intervals.
**/
@:structInit
@:go.Type({ name: "Ticker", instanceName: "time.Ticker", imports: ["time"] })
extern class Ticker {

    @:native("C") var C: go.Chan<go.time.Time>;

    function new(C: go.Chan<go.time.Time>=null);

    /**
        Reset stops a ticker and resets its period to the specified duration.
        The next tick will arrive after the new period elapses. The duration d
        must be greater than zero; if not, Reset will panic.
    **/
    @:native("Reset") function reset(d: go.time.Duration): Void;
    /**
        Stop turns off a ticker. After Stop, no more ticks will be sent.
        Stop does not close the channel, to prevent a concurrent goroutine
        reading from the channel from seeing an erroneous "tick".
    **/
    @:native("Stop") function stop(): Void;

}