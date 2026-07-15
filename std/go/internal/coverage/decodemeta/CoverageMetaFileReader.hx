package go.internal.coverage.decodemeta;

@:structInit
@:go.Type({ name: "CoverageMetaFileReader", instanceName: "decodemeta.CoverageMetaFileReader", imports: ["internal/coverage/decodemeta"] })
extern class CoverageMetaFileReader {

    @:native("CounterGranularity") function counterGranularity(): go.internal.coverage.CounterGranularity;
    @:native("CounterMode") function counterMode(): go.internal.coverage.CounterMode;
    @:native("FileHash") function fileHash(): go.GoArray<go.Byte, 16>;
    @:go.Tuple("p0", "p1", "p2") @:native("GetPackageDecoder") function getPackageDecoder(pkIdx: go.UInt32, payloadbuf: go.Slice<go.Byte>): go.Tuple<{ p0: go.Pointer<go.internal.coverage.decodemeta.CoverageMetaDataDecoder>, p1: go.Slice<go.Byte>, p2: go.Error }>;
    @:native("GetPackagePayload") function getPackagePayload(pkIdx: go.UInt32, payloadbuf: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("NumPackages") function numPackages(): go.UInt64;

}