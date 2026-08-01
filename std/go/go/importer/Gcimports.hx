package go.go.importer;

@:structInit
@:go.Type({ name: "gcimports", instanceName: "importer.gcimports", imports: ["go/importer"] })
extern class Gcimports {

    @:native("Import") function _import(path: String): (go.Result<go.Pointer<go.go.types.Package>>);
    @:native("ImportFrom") function importFrom(path: String, srcDir: String, mode: go.go.types.ImportMode): (go.Result<go.Pointer<go.go.types.Package>>);

}