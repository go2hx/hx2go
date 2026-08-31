package go.runtime.trace;

/**
    FlightRecorder represents a single consumer of a Go execution
    trace.
    It tracks a moving window over the execution trace produced by
    the runtime, always containing the most recent trace data.
    
    At most one flight recorder may be active at any given time,
    though flight recording is allowed to be concurrently active
    with a trace consumer using trace.Start.
    This restriction of only a single flight recorder may be removed
    in the future.
**/
@:structInit
@:go.Type({ name: "FlightRecorder", instanceName: "trace.FlightRecorder", imports: ["runtime/trace"] })
extern class FlightRecorder {

    /**
        Enabled returns true if the flight recorder is active.
        Specifically, it will return true if Start did not return an error, and Stop has not yet been called.
        It is safe to call from multiple goroutines simultaneously.
    **/
    @:native("Enabled") function enabled(): (Bool);
    /**
        Start activates the flight recorder and begins recording trace data.
        Only one call to trace.Start may be active at any given time.
        In addition, currently only one flight recorder may be active in the program.
        Returns an error if the flight recorder cannot be started or is already started.
    **/
    @:native("Start") function start(): (go.Error);
    /**
        Stop ends recording of trace data. It blocks until any concurrent WriteTo calls complete.
    **/
    @:native("Stop") function stop(): Void;
    /**
        WriteTo snapshots the moving window tracked by the flight recorder.
        The snapshot is expected to contain data that is up-to-date as of when WriteTo is called,
        though this is not a hard guarantee.
        Only one goroutine may execute WriteTo at a time.
        An error is returned upon failure to write to w, if another WriteTo call is already in-progress,
        or if the flight recorder is inactive.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}