package go.golang_org.x.tools.go.packages;

/**
    An Error describes a problem with a package's metadata, syntax, or types.
**/
@:structInit
@:go.Type({ name: "Error", instanceName: "packages.Error", imports: ["golang.org/x/tools/go/packages"] })
extern class Error {

    @:native("Pos") var pos: String;
    @:native("Msg") var msg: String;
    @:native("Kind") var kind: go.golang_org.x.tools.go.packages.ErrorKind;

    function new(pos: String="", msg: String="", kind: go.golang_org.x.tools.go.packages.ErrorKind=cast 0);

    @:native("Error") function error(): (String);

}