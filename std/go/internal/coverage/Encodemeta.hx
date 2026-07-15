package go.internal.coverage;

@:go.Type({ name: "encodemeta", instanceName: "encodemeta.encodemeta", imports: ["internal/coverage/encodemeta"] })
extern class Encodemeta {

    @:native("HashFuncDesc") static function hashFuncDesc(f: go.Pointer<go.internal.coverage.FuncDesc>): go.GoArray<go.Byte, 16>;
    @:native("NewCoverageMetaDataBuilder") static function newCoverageMetaDataBuilder(pkgpath: String, pkgname: String, modulepath: String): go.Result<go.Pointer<go.internal.coverage.encodemeta.CoverageMetaDataBuilder>>;
    @:native("NewCoverageMetaFileWriter") static function newCoverageMetaFileWriter(mfname: String, w: go.io.Writer): go.Pointer<go.internal.coverage.encodemeta.CoverageMetaFileWriter>;

}