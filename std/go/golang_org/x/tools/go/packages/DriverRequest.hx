package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "DriverRequest", instanceName: "packages.DriverRequest", imports: ["golang.org/x/tools/go/packages"] })
extern class DriverRequest {

    @:native("Mode") var mode: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("Env") var env: go.Slice<String>;
    @:native("BuildFlags") var buildFlags: go.Slice<String>;
    @:native("Tests") var tests: Bool;
    @:native("Overlay") var overlay: go.Map<String, go.Slice<go.Byte>>;

    function new(mode: go.golang_org.x.tools.go.packages.LoadMode, env: go.Slice<String>, buildFlags: go.Slice<String>, tests: Bool, overlay: go.Map<String, go.Slice<go.Byte>>);

}