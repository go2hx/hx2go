package go.testing;

@:structInit
@:go.Type({ name: "B", instanceName: "testing.B", imports: ["testing"] })
extern class B {

    @:native("N") var N: go.GoInt;

function new(N: go.GoInt);

    @:native("ArtifactDir") function artifactDir(): String;
    @:native("Attr") function attr(key: String, value: String): Void;
    @:native("Chdir") function chdir(dir: String): Void;
    @:native("Cleanup") function cleanup(f: () -> Void): Void;
    @:native("Context") function context(): go.context.Context;
    @:native("Elapsed") function elapsed(): go.time.Duration;
    @:native("Error") function error(args: haxe.Rest<Dynamic>): Void;
    @:native("Errorf") function errorf(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Fail") function fail(): Void;
    @:native("FailNow") function failNow(): Void;
    @:native("Failed") function failed(): Bool;
    @:native("Fatal") function fatal(args: haxe.Rest<Dynamic>): Void;
    @:native("Fatalf") function fatalf(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Helper") function helper(): Void;
    @:native("Log") function log(args: haxe.Rest<Dynamic>): Void;
    @:native("Logf") function logf(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Loop") function loop(): Bool;
    @:native("Name") function name(): String;
    @:native("Output") function output(): go.io.Writer;
    @:native("ReportAllocs") function reportAllocs(): Void;
    @:native("ReportMetric") function reportMetric(n: Float, unit: String): Void;
    @:native("ResetTimer") function resetTimer(): Void;
    @:native("Run") function run(name: String, f: (b: go.Pointer<go.testing.B>) -> Void): Bool;
    @:native("RunParallel") function runParallel(body: (p0: go.Pointer<go.testing.PB>) -> Void): Void;
    @:native("SetBytes") function setBytes(n: go.Int64): Void;
    @:native("SetParallelism") function setParallelism(p: go.GoInt): Void;
    @:native("Setenv") function setenv(key: String, value: String): Void;
    @:native("Skip") function skip(args: haxe.Rest<Dynamic>): Void;
    @:native("SkipNow") function skipNow(): Void;
    @:native("Skipf") function skipf(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Skipped") function skipped(): Bool;
    @:native("StartTimer") function startTimer(): Void;
    @:native("StopTimer") function stopTimer(): Void;
    @:native("TempDir") function tempDir(): String;

}