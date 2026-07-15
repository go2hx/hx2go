package go.runtime;

@:go.Type({ name: "cgo", instanceName: "cgo.cgo", imports: ["runtime/cgo"] })
extern class Cgo {

    @:native("NewHandle") static function newHandle(v: Dynamic): go.runtime.cgo.Handle;

}