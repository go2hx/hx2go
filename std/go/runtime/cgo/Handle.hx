package go.runtime.cgo;

@:go.Type({ name: "Handle", instanceName: "cgo.Handle", imports: ["runtime/cgo"] })
extern typedef Handle = haxe.extern.EitherType<go.UIntPtr, {
    @:native("Delete") function delete(): Void;
    @:native("Value") function value(): (Dynamic);

}>