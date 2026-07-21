package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "Error", instanceName: "packages.Error", imports: ["golang.org/x/tools/go/packages"] })
extern class Error {

    @:native("Pos") var pos: String;
    @:native("Msg") var msg: String;
    @:native("Kind") var kind: go.golang_org.x.tools.go.packages.ErrorKind;

    function new(pos: String, msg: String, kind: go.golang_org.x.tools.go.packages.ErrorKind);

    @:native("Error") function error(): (String);

}