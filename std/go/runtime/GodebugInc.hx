package go.runtime;

@:structInit
@:go.Type({ name: "godebugInc", instanceName: "runtime.godebugInc", imports: ["runtime"] })
extern class GodebugInc {

    @:native("IncNonDefault") function incNonDefault(): Void;

}