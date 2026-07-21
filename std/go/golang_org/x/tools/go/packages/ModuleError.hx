package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "ModuleError", instanceName: "packages.ModuleError", imports: ["golang.org/x/tools/go/packages"] })
extern class ModuleError {

    @:native("Err") var err: String;

    function new(err: String);

}