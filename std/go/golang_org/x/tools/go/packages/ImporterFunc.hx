package go.golang_org.x.tools.go.packages;

@:go.Type({ name: "importerFunc", instanceName: "packages.importerFunc", imports: ["golang.org/x/tools/go/packages"] })
extern class ImporterFunc {

    @:native("Import") function _import(path: String): (go.Result<go.Pointer<go.go.types.Package>>);

}