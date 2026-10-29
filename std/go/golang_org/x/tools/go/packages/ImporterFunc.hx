package go.golang_org.x.tools.go.packages;

@:go.Type({ name: "importerFunc", instanceName: "packages.importerFunc", imports: ["golang.org/x/tools/go/packages"] })
extern typedef ImporterFunc = haxe.extern.EitherType<(path: String) -> (go.Result<go.Pointer<go.go.types.Package>>), {
    @:native("Import") function _import(path: String): (go.Result<go.Pointer<go.go.types.Package>>);

}>