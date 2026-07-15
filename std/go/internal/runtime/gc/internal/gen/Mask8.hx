package go.internal.runtime.gc.internal.gen;

@:structInit
@:go.Type({ name: "Mask8", instanceName: "gen.Mask8", imports: ["internal/runtime/gc/internal/gen"] })
extern class Mask8 {

    @:native("Or") function or(y: go.internal.runtime.gc.internal.gen.Mask8): go.internal.runtime.gc.internal.gen.Mask8;
    @:native("ShiftLeft") function shiftLeft(c: go.UInt8): go.internal.runtime.gc.internal.gen.Mask8;
    @:native("String") function string(): String;
    @:native("ToUint8") function toUint8(): go.internal.runtime.gc.internal.gen.Uint64;

}