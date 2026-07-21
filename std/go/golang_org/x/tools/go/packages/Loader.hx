package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "loader", instanceName: "packages.loader", imports: ["golang.org/x/tools/go/packages"] })
extern class Loader {

    @:native("Config") var config: go.golang_org.x.tools.go.packages.Config;
    @:native("Mode") var mode: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("Context") var context: go.context.Context;
    @:native("Logf") var logf: (format: String, args: haxe.Rest<Dynamic>) -> Void;
    @:native("Dir") var dir: String;
    @:native("Env") var env: go.Slice<String>;
    @:native("BuildFlags") var buildFlags: go.Slice<String>;
    @:native("Fset") var fset: go.Pointer<go.go.token.FileSet>;
    @:native("ParseFile") var parseFile: (fset: go.Pointer<go.go.token.FileSet>, filename: String, src: go.Slice<go.Byte>) -> (go.Result<go.Pointer<go.go.ast.File>>);
    @:native("Tests") var tests: Bool;
    @:native("Overlay") var overlay: go.Map<String, go.Slice<go.Byte>>;

    function new(config: go.golang_org.x.tools.go.packages.Config);

}