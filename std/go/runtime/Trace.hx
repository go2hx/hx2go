package go.runtime;

@:go.Type({ name: "trace", instanceName: "trace.trace", imports: ["runtime/trace"] })
extern class Trace {

    @:native("IsEnabled") static function isEnabled(): Bool;
    @:native("Log") static function log(ctx: go.context.Context, category: String, message: String): Void;
    @:native("Logf") static function logf(ctx: go.context.Context, category: String, format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("NewFlightRecorder") static function newFlightRecorder(cfg: go.runtime.trace.FlightRecorderConfig): go.Pointer<go.runtime.trace.FlightRecorder>;
    @:go.Tuple("ctx", "task") @:native("NewTask") static function newTask(pctx: go.context.Context, taskType: String): go.Tuple<{ ctx: go.context.Context, task: go.Pointer<go.runtime.trace.Task> }>;
    @:native("Start") static function start(w: go.io.Writer): go.Error;
    @:native("StartRegion") static function startRegion(ctx: go.context.Context, regionType: String): go.Pointer<go.runtime.trace.Region>;
    @:native("Stop") static function stop(): Void;
    @:native("WithRegion") static function withRegion(ctx: go.context.Context, regionType: String, fn: () -> Void): Void;

}