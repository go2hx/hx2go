package go.math.rand.v2;

@:structInit
@:go.Type({ name: "Rand", instanceName: "rand.Rand", imports: ["math/rand/v2"] })
extern class Rand {

    @:native("ExpFloat64") function expFloat64(): (Float);
    @:native("Float32") function float32(): (go.Float32);
    @:native("Float64") function float64(): (Float);
    @:native("Int") function int(): (go.GoInt);
    @:native("Int32") function int32(): (go.Int32);
    @:native("Int32N") function int32N(n: go.Int32): (go.Int32);
    @:native("Int64") function int64(): (go.Int64);
    @:native("Int64N") function int64N(n: go.Int64): (go.Int64);
    @:native("IntN") function intN(n: go.GoInt): (go.GoInt);
    @:native("NormFloat64") function normFloat64(): (Float);
    @:native("Perm") function perm(n: go.GoInt): (go.Slice<go.GoInt>);
    @:native("Shuffle") function shuffle(n: go.GoInt, swap: (i: go.GoInt, j: go.GoInt) -> Void): Void;
    @:native("Uint") function uint(): (go.GoUInt);
    @:native("Uint32") function uint32(): (go.UInt32);
    @:native("Uint32N") function uint32N(n: go.UInt32): (go.UInt32);
    @:native("Uint64") function uint64(): (go.UInt64);
    @:native("Uint64N") function uint64N(n: go.UInt64): (go.UInt64);
    @:native("UintN") function uintN(n: go.GoUInt): (go.GoUInt);

}