package go.internal.coverage;

@:go.Type({ name: "encodecounter", instanceName: "encodecounter.encodecounter", imports: ["internal/coverage/encodecounter"] })
extern class Encodecounter {

    @:native("NewCoverageDataWriter") static function newCoverageDataWriter(w: go.io.Writer, flav: go.internal.coverage.CounterFlavor): go.Pointer<go.internal.coverage.encodecounter.CoverageDataWriter>;

}