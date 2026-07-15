package go.runtime;

@:structInit
@:go.Type({ name: "Pinner", instanceName: "runtime.Pinner", imports: ["runtime"] })
extern class Pinner {

    @:native("Pin") function pin(pointer: Dynamic): Void;
    @:native("Unpin") function unpin(): Void;

}