package go.math;

@:go.Type({ name: "rand", instanceName: "rand.rand", imports: ["math/rand"] })
extern class Rand {

    @:native("ExpFloat64") static function expFloat64(): (Float);
    @:native("Float32") static function float32(): (go.Float32);
    @:native("Float64") static function float64(): (Float);
    @:native("Int") static function int(): (go.GoInt);
    @:native("Int31") static function int31(): (go.Int32);
    @:native("Int31n") static function int31n(n: go.Int32): (go.Int32);
    @:native("Int63") static function int63(): (go.Int64);
    @:native("Int63n") static function int63n(n: go.Int64): (go.Int64);
    @:native("Intn") static function intn(n: go.GoInt): (go.GoInt);
    @:native("New") static function _new(src: go.math.rand.Source): (go.Pointer<go.math.rand.Rand>);
    @:native("NewSource") static function newSource(seed: go.Int64): (go.math.rand.Source);
    @:native("NewZipf") static function newZipf(r: go.Pointer<go.math.rand.Rand>, s: Float, v: Float, imax: go.UInt64): (go.Pointer<go.math.rand.Zipf>);
    @:native("NormFloat64") static function normFloat64(): (Float);
    @:native("Perm") static function perm(n: go.GoInt): (go.Slice<go.GoInt>);
    @:native("Read") static function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Seed") static function seed(seed: go.Int64): Void;
    @:native("Shuffle") static function shuffle(n: go.GoInt, swap: (i: go.GoInt, j: go.GoInt) -> Void): Void;
    @:native("Uint32") static function uint32(): (go.UInt32);
    @:native("Uint64") static function uint64(): (go.UInt64);

}