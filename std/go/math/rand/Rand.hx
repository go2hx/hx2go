package go.math.rand;

@:structInit
@:go.Type({ name: "Rand", instanceName: "rand.Rand", imports: ["math/rand"] })
extern class Rand {

    @:native("ExpFloat64") function expFloat64(): Float;
    @:native("Float32") function float32(): go.Float32;
    @:native("Float64") function float64(): Float;
    @:native("Int") function int(): go.GoInt;
    @:native("Int31") function int31(): go.Int32;
    @:native("Int31n") function int31n(n: go.Int32): go.Int32;
    @:native("Int63") function int63(): go.Int64;
    @:native("Int63n") function int63n(n: go.Int64): go.Int64;
    @:native("Intn") function intn(n: go.GoInt): go.GoInt;
    @:native("NormFloat64") function normFloat64(): Float;
    @:native("Perm") function perm(n: go.GoInt): go.Slice<go.GoInt>;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Seed") function seed(seed: go.Int64): Void;
    @:native("Shuffle") function shuffle(n: go.GoInt, swap: (i: go.GoInt, j: go.GoInt) -> Void): Void;
    @:native("Uint32") function uint32(): go.UInt32;
    @:native("Uint64") function uint64(): go.UInt64;

}