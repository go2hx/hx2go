package go.internal.runtime.gc.internal.gen;

@:structInit
@:go.Type({ name: "Mask64", instanceName: "gen.Mask64", imports: ["internal/runtime/gc/internal/gen"] })
extern class Mask64 {

    @:native("Or") function or(y: go.internal.runtime.gc.internal.gen.Mask64): go.internal.runtime.gc.internal.gen.Mask64;
    @:native("ShiftLeft") function shiftLeft(c: go.UInt8): go.internal.runtime.gc.internal.gen.Mask64;
    @:native("ShiftRight") function shiftRight(c: go.UInt8): go.internal.runtime.gc.internal.gen.Mask64;
    @:native("String") function string(): String;
    @:native("ToUint64") function toUint64(): go.internal.runtime.gc.internal.gen.Uint64;

}