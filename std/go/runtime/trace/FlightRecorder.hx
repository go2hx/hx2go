package go.runtime.trace;

@:structInit
@:go.Type({ name: "FlightRecorder", instanceName: "trace.FlightRecorder", imports: ["runtime/trace"] })
extern class FlightRecorder {

    @:native("Enabled") function enabled(): Bool;
    @:native("Start") function start(): go.Error;
    @:native("Stop") function stop(): Void;
    @:native("WriteTo") function writeTo(w: go.io.Writer): go.Result<go.Int64>;

}