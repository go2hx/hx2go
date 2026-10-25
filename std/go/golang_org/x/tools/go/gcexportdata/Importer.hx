package go.golang_org.x.tools.go.gcexportdata;

@:structInit
@:go.Type({ name: "importer", instanceName: "gcexportdata.importer", imports: ["golang.org/x/tools/go/gcexportdata"] })
extern class Importer {

    @:native("Import") function _import(importPath: String): (go.Result<go.Pointer<go.go.types.Package>>);
    @:native("ImportFrom") function importFrom(importPath: String, srcDir: String, mode: go.go.types.ImportMode): (go.Result<go.Pointer<go.go.types.Package>>);

}