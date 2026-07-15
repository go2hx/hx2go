package go.runtime.debug;

@:structInit
@:go.Type({ name: "Module", instanceName: "debug.Module", imports: ["runtime/debug"] })
extern class Module {

    @:native("Path") var path: String;
    @:native("Version") var version: String;
    @:native("Sum") var sum: String;
    @:native("Replace") var replace: go.Pointer<go.runtime.debug.Module>;

function new(path: String, version: String, sum: String, replace: go.Pointer<go.runtime.debug.Module>);

}