package go.go.internal.srcimporter;

@:structInit
@:go.Type({ name: "Importer", instanceName: "srcimporter.Importer", imports: ["go/internal/srcimporter"] })
extern class Importer {

    @:native("Import") function _import(path: String): go.Result<go.Pointer<go.go.types.Package>>;
    @:native("ImportFrom") function importFrom(path: String, srcDir: String, mode: go.go.types.ImportMode): go.Result<go.Pointer<go.go.types.Package>>;

}