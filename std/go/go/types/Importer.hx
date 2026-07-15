package go.go.types;

@:go.Type({ name: "Importer", instanceName: "types.Importer", imports: ["go/types"] })
extern typedef Importer = {

    @:native("Import") function _import(path: String): go.Result<go.Pointer<go.go.types.Package>>;

}