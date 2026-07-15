package go.go;

@:go.Type({ name: "importer", instanceName: "importer.importer", imports: ["go/importer"] })
extern class Importer {

    @:native("Default") static function _default(): go.go.types.Importer;
    @:native("For") static function _for(compiler: String, lookup: go.go.importer.Lookup): go.go.types.Importer;
    @:native("ForCompiler") static function forCompiler(fset: go.Pointer<go.go.token.FileSet>, compiler: String, lookup: go.go.importer.Lookup): go.go.types.Importer;

}