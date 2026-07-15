package go.internal.coverage;

@:structInit
@:go.Type({ name: "MetaSymbolHeader", instanceName: "coverage.MetaSymbolHeader", imports: ["internal/coverage"] })
extern class MetaSymbolHeader {

    @:native("Length") var length: go.UInt32;
    @:native("PkgName") var pkgName: go.UInt32;
    @:native("PkgPath") var pkgPath: go.UInt32;
    @:native("ModulePath") var modulePath: go.UInt32;
    @:native("MetaHash") var metaHash: go.GoArray<go.Byte, 16>;
    @:native("NumFiles") var numFiles: go.UInt32;
    @:native("NumFuncs") var numFuncs: go.UInt32;

function new(length: go.UInt32, pkgName: go.UInt32, pkgPath: go.UInt32, modulePath: go.UInt32, metaHash: go.GoArray<go.Byte, 16>, numFiles: go.UInt32, numFuncs: go.UInt32);

}