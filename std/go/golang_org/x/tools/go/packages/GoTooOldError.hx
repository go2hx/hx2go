package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "goTooOldError", instanceName: "packages.goTooOldError", imports: ["golang.org/x/tools/go/packages"] })
extern class GoTooOldError {

    @:native("Error") function error(): (String);

}