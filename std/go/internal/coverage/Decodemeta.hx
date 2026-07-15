package go.internal.coverage;

@:go.Type({ name: "decodemeta", instanceName: "decodemeta.decodemeta", imports: ["internal/coverage/decodemeta"] })
extern class Decodemeta {

    @:native("NewCoverageMetaDataDecoder") static function newCoverageMetaDataDecoder(b: go.Slice<go.Byte>, readonly: Bool): go.Result<go.Pointer<go.internal.coverage.decodemeta.CoverageMetaDataDecoder>>;
    @:native("NewCoverageMetaFileReader") static function newCoverageMetaFileReader(f: go.Pointer<go.os.File>, fileView: go.Slice<go.Byte>): go.Result<go.Pointer<go.internal.coverage.decodemeta.CoverageMetaFileReader>>;

}