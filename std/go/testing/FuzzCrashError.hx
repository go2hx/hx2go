package go.testing;

@:go.Type({ name: "fuzzCrashError", instanceName: "testing.fuzzCrashError", imports: ["testing"] })
extern typedef FuzzCrashError = {

    @:native("CrashPath") function crashPath(): (String);
    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}