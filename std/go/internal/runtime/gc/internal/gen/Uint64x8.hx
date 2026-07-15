package go.internal.runtime.gc.internal.gen;

@:structInit
@:go.Type({ name: "Uint64x8", instanceName: "gen.Uint64x8", imports: ["internal/runtime/gc/internal/gen"] })
extern class Uint64x8 {

    @:native("BroadcastMasked") function broadcastMasked(src: go.internal.runtime.gc.internal.gen.Uint64, mask: go.internal.runtime.gc.internal.gen.Mask8): go.internal.runtime.gc.internal.gen.Uint64x8;
    @:native("GF2P8Affine") function gF2P8Affine(y: go.internal.runtime.gc.internal.gen.Uint8x64): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("Or") function or(y: go.internal.runtime.gc.internal.gen.Uint64x8): go.internal.runtime.gc.internal.gen.Uint64x8;
    @:native("ShuffleBits") function shuffleBits(y: go.internal.runtime.gc.internal.gen.Uint8x64): go.internal.runtime.gc.internal.gen.Mask64;
    @:native("ShuffleBitsMasked") function shuffleBitsMasked(y: go.internal.runtime.gc.internal.gen.Uint8x64, mask: go.internal.runtime.gc.internal.gen.Mask64): go.internal.runtime.gc.internal.gen.Mask64;
    @:native("String") function string(): String;
    @:native("Sub") function sub(y: go.internal.runtime.gc.internal.gen.Uint64x8): go.internal.runtime.gc.internal.gen.Uint64x8;
    @:native("ToUint8x64") function toUint8x64(): go.internal.runtime.gc.internal.gen.Uint8x64;

}