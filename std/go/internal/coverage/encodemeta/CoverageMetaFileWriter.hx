package go.internal.coverage.encodemeta;

@:structInit
@:go.Type({ name: "CoverageMetaFileWriter", instanceName: "encodemeta.CoverageMetaFileWriter", imports: ["internal/coverage/encodemeta"] })
extern class CoverageMetaFileWriter {

    @:native("Write") function write(finalHash: go.GoArray<go.Byte, 16>, blobs: go.Slice<go.Slice<go.Byte>>, mode: go.internal.coverage.CounterMode, granularity: go.internal.coverage.CounterGranularity): go.Error;

}