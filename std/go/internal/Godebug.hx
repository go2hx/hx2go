package go.internal;

@:go.Type({ name: "godebug", instanceName: "godebug.godebug", imports: ["internal/godebug"] })
extern class Godebug {

    @:native("New") static function _new(name: String): go.Pointer<go.internal.godebug.Setting>;

}