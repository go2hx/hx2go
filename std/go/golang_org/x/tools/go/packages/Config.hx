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

    function new(mode: go.golang_org.x.tools.go.packages.LoadMode=cast 0, context: go.context.Context=null, logf: (format: String, args: haxe.Rest<Dynamic>) -> Void=null, dir: String="", env: go.Slice<String>=null, buildFlags: go.Slice<String>=null, fset: go.Pointer<go.go.token.FileSet>=null, parseFile: (fset: go.Pointer<go.go.token.FileSet>, filename: String, src: go.Slice<go.Byte>) -> (go.Result<go.Pointer<go.go.ast.File>>)=null, tests: Bool=false, overlay: go.Map<String, go.Slice<go.Byte>>=null);

}