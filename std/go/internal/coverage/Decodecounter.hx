package go.internal.coverage;

@:go.Type({ name: "decodecounter", instanceName: "decodecounter.decodecounter", imports: ["internal/coverage/decodecounter"] })
extern class Decodecounter {

    @:native("NewCounterDataReader") static function newCounterDataReader(fn: String, rs: go.io.ReadSeeker): go.Result<go.Pointer<go.internal.coverage.decodecounter.CounterDataReader>>;

}