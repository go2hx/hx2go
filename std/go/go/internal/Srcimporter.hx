package go.go.internal;

@:go.Type({ name: "srcimporter", instanceName: "srcimporter.srcimporter", imports: ["go/internal/srcimporter"] })
extern class Srcimporter {

    @:native("New") static function _new(ctxt: go.Pointer<go.go.build.Context>, fset: go.Pointer<go.go.token.FileSet>, packages: go.Map<String, go.Pointer<go.go.types.Package>>): go.Pointer<go.go.internal.srcimporter.Importer>;

}