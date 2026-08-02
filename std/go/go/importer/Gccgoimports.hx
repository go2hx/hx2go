package go.go.importer;

@:structInit
@:go.Type({ name: "gccgoimports", instanceName: "importer.gccgoimports", imports: ["go/importer"] })
extern class Gccgoimports {

    @:native("Import") function _import(path: String): (go.Result<go.Pointer<go.go.types.Package>>);
    @:native("ImportFrom") function importFrom(path: String, srcDir: String, mode: go.go.types.ImportMode): (go.Result<go.Pointer<go.go.types.Package>>);

}