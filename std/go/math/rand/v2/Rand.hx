package go.math.rand.v2;

@:go.Type({ name: "rand", instanceName: "v2.rand", imports: ["math/rand/v2"] })
extern class Rand {

    @:native("ExpFloat64") static function expFloat64(): Float;
    @:native("Float32") static function float32(): go.Float32;
    @:native("Float64") static function float64(): Float;
    @:native("Int") static function int(): go.GoInt;
    @:native("Int32") static function int32(): go.Int32;
    @:native("Int32N") static function int32N(n: go.Int32): go.Int32;
    @:native("Int64") static function int64(): go.Int64;
    @:native("Int64N") static function int64N(n: go.Int64): go.Int64;
    @:native("IntN") static function intN(n: go.GoInt): go.GoInt;
    @:native("N") static function N<Int: go.math.rand.v2.intType>(n: Int): Int;
    @:native("New") static function _new(src: go.math.rand.v2.Source): go.Pointer<go.math.rand.v2.Rand>;
    @:native("NewChaCha8") static function newChaCha8(seed: go.GoArray<go.Byte, 32>): go.Pointer<go.math.rand.v2.ChaCha8>;
    @:native("NewPCG") static function newPCG(seed1: go.UInt64, seed2: go.UInt64): go.Pointer<go.math.rand.v2.PCG>;
    @:native("NewZipf") static function newZipf(r: go.Pointer<go.math.rand.v2.Rand>, s: Float, v: Float, imax: go.UInt64): go.Pointer<go.math.rand.v2.Zipf>;
    @:native("NormFloat64") static function normFloat64(): Float;
    @:native("Perm") static function perm(n: go.GoInt): go.Slice<go.GoInt>;
    @:native("Shuffle") static function shuffle(n: go.GoInt, swap: (i: go.GoInt, j: go.GoInt) -> Void): Void;
    @:native("Uint") static function uint(): go.GoUInt;
    @:native("Uint32") static function uint32(): go.UInt32;
    @:native("Uint32N") static function uint32N(n: go.UInt32): go.UInt32;
    @:native("Uint64") static function uint64(): go.UInt64;
    @:native("Uint64N") static function uint64N(n: go.UInt64): go.UInt64;
    @:native("UintN") static function uintN(n: go.GoUInt): go.GoUInt;

}