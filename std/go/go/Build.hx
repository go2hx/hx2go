package go.go;

@:go.Type({ name: "build", instanceName: "build.build", imports: ["go/build"] })
extern class Build {

    @:native("AllowBinary") static var AllowBinary: go.go.build.ImportMode;
    @:native("FindOnly") static var FindOnly: go.go.build.ImportMode;
    @:native("IgnoreVendor") static var IgnoreVendor: go.go.build.ImportMode;
    @:native("ImportComment") static var ImportComment: go.go.build.ImportMode;

    @:native("Default") static var Default: go.go.build.Context;
    @:native("ToolDir") static var ToolDir: String;

    @:native("ArchChar") static function archChar(goarch: String): go.Result<String>;
    @:native("Import") static function _import(path: String, srcDir: String, mode: go.go.build.ImportMode): go.Result<go.Pointer<go.go.build.Package>>;
    @:native("ImportDir") static function importDir(dir: String, mode: go.go.build.ImportMode): go.Result<go.Pointer<go.go.build.Package>>;
    @:native("IsLocalImport") static function isLocalImport(path: String): Bool;

}