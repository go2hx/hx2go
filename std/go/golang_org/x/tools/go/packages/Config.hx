package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "Config", instanceName: "packages.Config", imports: ["golang.org/x/tools/go/packages"] })
extern class Config {

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

    function new(mode: go.golang_org.x.tools.go.packages.LoadMode, context: go.context.Context, logf: (format: String, args: haxe.Rest<Dynamic>) -> Void, dir: String, env: go.Slice<String>, buildFlags: go.Slice<String>, fset: go.Pointer<go.go.token.FileSet>, parseFile: (fset: go.Pointer<go.go.token.FileSet>, filename: String, src: go.Slice<go.Byte>) -> (go.Result<go.Pointer<go.go.ast.File>>), tests: Bool, overlay: go.Map<String, go.Slice<go.Byte>>);

}