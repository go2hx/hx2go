package go.math;

@:pure
@:go.StaticAccess({ name: "rand", imports: ["math/rand"] })
extern class Rand {

    // TODO: this extern is incomplete - https://pkg.go.dev/math/rand

    @:native("ExpFloat64")
    static function expFloat64(): go.Float64;

    @:native("Float32")
    static function float32(): go.Float32;

    @:native("Float64")
    static function float64(): go.Float64;

    @:native("Int")
    static function int(): go.GoInt;

    @:native("Int31")
    static function int3 1(): go.Int32;

    @:native("Int31n")
    static function int31n(n: go.Int32): go.Int32;

    @:native("Int63")
    static function int63(): go.Int64;

    @:native("Int63n")
    static function int63n(n: go.Int64): go.Int64;

    @:native("Intn")
    static function intn(n: go.GoInt): go.GoInt;

    @:native("NormFloat64")
    static function normFloat64(): go.Float64;

    @:native("Uint32")
    static function uint32(): go.UInt32;

    @:native("Uint64")
    static function uint64(): go.UInt64;

}
