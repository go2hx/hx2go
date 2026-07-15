package go.internal.coverage.encodemeta;

@:structInit
@:go.Type({ name: "CoverageMetaDataBuilder", instanceName: "encodemeta.CoverageMetaDataBuilder", imports: ["internal/coverage/encodemeta"] })
extern class CoverageMetaDataBuilder {

    @:native("AddFunc") function addFunc(f: go.internal.coverage.FuncDesc): go.GoUInt;
    @:native("Emit") function emit(w: go.io.WriteSeeker): go.Result<go.GoArray<go.Byte, 16>>;

}