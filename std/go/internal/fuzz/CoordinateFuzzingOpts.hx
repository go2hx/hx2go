package go.internal.fuzz;

@:structInit
@:go.Type({ name: "CoordinateFuzzingOpts", instanceName: "fuzz.CoordinateFuzzingOpts", imports: ["internal/fuzz"] })
extern class CoordinateFuzzingOpts {

    @:native("Log") var log: go.io.Writer;
    @:native("Timeout") var timeout: go.time.Duration;
    @:native("Limit") var limit: go.Int64;
    @:native("MinimizeTimeout") var minimizeTimeout: go.time.Duration;
    @:native("MinimizeLimit") var minimizeLimit: go.Int64;
    @:native("Parallel") var parallel: go.GoInt;
    @:native("Seed") var seed: go.Slice<go.internal.fuzz.CorpusEntry>;
    @:native("Types") var types: go.Slice<go.reflect.Type>;
    @:native("CorpusDir") var corpusDir: String;
    @:native("CacheDir") var cacheDir: String;

function new(log: go.io.Writer, timeout: go.time.Duration, limit: go.Int64, minimizeTimeout: go.time.Duration, minimizeLimit: go.Int64, parallel: go.GoInt, seed: go.Slice<go.internal.fuzz.CorpusEntry>, types: go.Slice<go.reflect.Type>, corpusDir: String, cacheDir: String);

}