package go.go.internal;

@:go.Type({ name: "gcimporter", instanceName: "gcimporter.gcimporter", imports: ["go/internal/gcimporter"] })
extern class Gcimporter {

    @:native("Import") static function _import(fset: go.Pointer<go.go.token.FileSet>, packages: go.Map<String, go.Pointer<go.go.types.Package>>, path: String, srcDir: String, lookup: (path: String) -> go.Result<go.io.ReadCloser>): go.Result<go.Pointer<go.go.types.Package>>;

}