package go.internal.coverage.decodemeta;

@:structInit
@:go.Type({ name: "CoverageMetaDataDecoder", instanceName: "decodemeta.CoverageMetaDataDecoder", imports: ["internal/coverage/decodemeta"] })
extern class CoverageMetaDataDecoder {

    @:native("ModulePath") function modulePath(): String;
    @:native("NumFuncs") function numFuncs(): go.UInt32;
    @:native("PackageName") function packageName(): String;
    @:native("PackagePath") function packagePath(): String;
    @:native("ReadFunc") function readFunc(fidx: go.UInt32, f: go.Pointer<go.internal.coverage.FuncDesc>): go.Error;

}