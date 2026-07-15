package go.testing;

@:structInit
@:go.Type({ name: "T", instanceName: "testing.T", imports: ["testing"] })
extern class T {

    @:native("ArtifactDir") function artifactDir(): String;
    @:native("Attr") function attr(key: String, value: String): Void;
    @:native("Chdir") function chdir(dir: String): Void;
    @:native("Cleanup") function cleanup(f: () -> Void): Void;
    @:native("Context") function context(): go.context.Context;
    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): go.Tuple<{ deadline: go.time.Time, ok: Bool }>;
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
    @:native("Name") function name(): String;
    @:native("Output") function output(): go.io.Writer;
    @:native("Parallel") function parallel(): Void;
    @:native("Run") function run(name: String, f: (t: go.Pointer<go.testing.T>) -> Void): Bool;
    @:native("Setenv") function setenv(key: String, value: String): Void;
    @:native("Skip") function skip(args: haxe.Rest<Dynamic>): Void;
    @:native("SkipNow") function skipNow(): Void;
    @:native("Skipf") function skipf(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Skipped") function skipped(): Bool;
    @:native("TempDir") function tempDir(): String;

}