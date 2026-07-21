package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "Module", instanceName: "packages.Module", imports: ["golang.org/x/tools/go/packages"] })
extern class Module {

    @:native("Path") var path: String;
    @:native("Version") var version: String;
    @:native("Replace") var replace: go.Pointer<go.golang_org.x.tools.go.packages.Module>;
    @:native("Time") var time: go.Pointer<go.time.Time>;
    @:native("Main") var main: Bool;
    @:native("Indirect") var indirect: Bool;
    @:native("Dir") var dir: String;
    @:native("GoMod") var goMod: String;
    @:native("GoVersion") var goVersion: String;
    @:native("Error") var error: go.Pointer<go.golang_org.x.tools.go.packages.ModuleError>;

    function new(path: String, version: String, replace: go.Pointer<go.golang_org.x.tools.go.packages.Module>, time: go.Pointer<go.time.Time>, main: Bool, indirect: Bool, dir: String, goMod: String, goVersion: String, error: go.Pointer<go.golang_org.x.tools.go.packages.ModuleError>);

}