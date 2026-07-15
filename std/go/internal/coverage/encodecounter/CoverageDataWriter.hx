package go.internal.coverage.encodecounter;

@:structInit
@:go.Type({ name: "CoverageDataWriter", instanceName: "encodecounter.CoverageDataWriter", imports: ["internal/coverage/encodecounter"] })
extern class CoverageDataWriter {

    @:native("AppendSegment") function appendSegment(args: go.Map<String, String>, visitor: go.internal.coverage.encodecounter.CounterVisitor): go.Error;
    @:native("Write") function write(metaFileHash: go.GoArray<go.Byte, 16>, args: go.Map<String, String>, visitor: go.internal.coverage.encodecounter.CounterVisitor): go.Error;

}