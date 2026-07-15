package go.go.internal;

@:go.Type({ name: "gccgoimporter", instanceName: "gccgoimporter.gccgoimporter", imports: ["go/internal/gccgoimporter"] })
extern class Gccgoimporter {

    @:native("GetImporter") static function getImporter(searchpaths: go.Slice<String>, initmap: go.Map<go.Pointer<go.go.types.Package>, go.go.internal.gccgoimporter.InitData>): go.go.internal.gccgoimporter.Importer;

}