package go.golang_org.x.tools.go.packages;

/**
    DriverRequest defines the schema of a request for package metadata
    from an external driver program. The JSON-encoded DriverRequest
    message is provided to the driver program's standard input. The
    query patterns are provided as command-line arguments.
    
    See the package documentation for an overview.
**/
@:structInit
@:go.Type({ name: "DriverRequest", instanceName: "packages.DriverRequest", imports: ["golang.org/x/tools/go/packages"] })
extern class DriverRequest {

    @:native("Mode") var mode: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("Env") var env: go.Slice<String>;
    @:native("BuildFlags") var buildFlags: go.Slice<String>;
    @:native("Tests") var tests: Bool;
    @:native("Overlay") var overlay: go.Map<String, go.Slice<go.Byte>>;

    function new(mode: go.golang_org.x.tools.go.packages.LoadMode=cast 0, env: go.Slice<String>=null, buildFlags: go.Slice<String>=null, tests: Bool=false, overlay: go.Map<String, go.Slice<go.Byte>>=null);

}