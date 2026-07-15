package go.internal.runtime.gc.internal.gen;

@:structInit
@:go.Type({ name: "Uint8x64", instanceName: "gen.Uint8x64", imports: ["internal/runtime/gc/internal/gen"] })
extern class Uint8x64 {

    @:native("Shuffle") function shuffle(shuf: go.internal.runtime.gc.internal.gen.Uint8x64): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("Shuffle2") function shuffle2(y: go.internal.runtime.gc.internal.gen.Uint8x64, shuf: go.internal.runtime.gc.internal.gen.Uint8x64): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("Shuffle2Masked") function shuffle2Masked(y: go.internal.runtime.gc.internal.gen.Uint8x64, shuf: go.internal.runtime.gc.internal.gen.Uint8x64, mask: go.internal.runtime.gc.internal.gen.Mask64): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("Shuffle2Zeroed") function shuffle2Zeroed(y: go.internal.runtime.gc.internal.gen.Uint8x64, shuf: go.internal.runtime.gc.internal.gen.Uint8x64, mask: go.internal.runtime.gc.internal.gen.Mask64): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("ShuffleMasked") function shuffleMasked(shuf: go.internal.runtime.gc.internal.gen.Uint8x64, mask: go.internal.runtime.gc.internal.gen.Mask64): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("ShuffleZeroed") function shuffleZeroed(shuf: go.internal.runtime.gc.internal.gen.Uint8x64, mask: go.internal.runtime.gc.internal.gen.Mask64): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("String") function string(): String;
    @:native("ToUint64x8") function toUint64x8(): go.internal.runtime.gc.internal.gen.Uint64x8;

}