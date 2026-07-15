package go.go.internal.gccgoimporter;

@:structInit
@:go.Type({ name: "GccgoInstallation", instanceName: "gccgoimporter.GccgoInstallation", imports: ["go/internal/gccgoimporter"] })
extern class GccgoInstallation {

    @:native("GccVersion") var gccVersion: String;
    @:native("TargetTriple") var targetTriple: String;
    @:native("LibPaths") var libPaths: go.Slice<String>;

function new(gccVersion: String, targetTriple: String, libPaths: go.Slice<String>);

    @:native("GetImporter") function getImporter(incpaths: go.Slice<String>, initmap: go.Map<go.Pointer<go.go.types.Package>, go.go.internal.gccgoimporter.InitData>): go.go.internal.gccgoimporter.Importer;
    @:native("InitFromDriver") function initFromDriver(gccgoPath: String, args: haxe.Rest<String>): go.Error;
    @:native("SearchPaths") function searchPaths(): go.Slice<String>;

}