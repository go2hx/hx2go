package go.internal.fuzz;

@:structInit
@:go.Type({ name: "MalformedCorpusError", instanceName: "fuzz.MalformedCorpusError", imports: ["internal/fuzz"] })
extern class MalformedCorpusError {

    @:native("Error") function error(): String;

}