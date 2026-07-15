package go.runtime;

@:go.Type({ name: "pprof", instanceName: "pprof.pprof", imports: ["runtime/pprof"] })
extern class Pprof {

    @:native("Do") static function _do(ctx: go.context.Context, labels: go.runtime.pprof.LabelSet, f: (p0: go.context.Context) -> Void): Void;
    @:native("ForLabels") static function forLabels(ctx: go.context.Context, f: (key: String, value: String) -> Bool): Void;
    @:go.Tuple("p0", "p1") @:native("Label") static function label(ctx: go.context.Context, key: String): go.Tuple<{ p0: String, p1: Bool }>;
    @:native("Labels") static function labels(args: haxe.Rest<String>): go.runtime.pprof.LabelSet;
    @:native("Lookup") static function lookup(name: String): go.Pointer<go.runtime.pprof.Profile>;
    @:native("NewProfile") static function newProfile(name: String): go.Pointer<go.runtime.pprof.Profile>;
    @:native("Profiles") static function profiles(): go.Slice<go.Pointer<go.runtime.pprof.Profile>>;
    @:native("SetGoroutineLabels") static function setGoroutineLabels(ctx: go.context.Context): Void;
    @:native("StartCPUProfile") static function startCPUProfile(w: go.io.Writer): go.Error;
    @:native("StopCPUProfile") static function stopCPUProfile(): Void;
    @:native("WithLabels") static function withLabels(ctx: go.context.Context, labels: go.runtime.pprof.LabelSet): go.context.Context;
    @:native("WriteHeapProfile") static function writeHeapProfile(w: go.io.Writer): go.Error;

}