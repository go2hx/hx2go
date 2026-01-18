package go.math;

@:pure
@:go.package("math/rand")
@:go.native("rand")
extern class Rand {

    // TODO: this extern is incomplete - https://pkg.go.dev/math/rand

    @:go.native("ExpFloat64")
    static function expFloat64(): go.Float64;

    @:go.native("Float32")
    static function float32(): go.Float32;

    @:go.native("Float64")
    static function float64(): go.Float64;

    @:go.native("Int")
    static function int(): go.GoInt;

    @:go.native("Int31")
    static function int31(): go.Int32;

    @:go.native("Int31n")
    static function int31n(n: go.Int32): go.Int32;

    @:go.native("Int63")
    static function int63(): go.Int64;

    @:go.native("Int63n")
    static function int63n(n: go.Int64): go.Int64;

    @:go.native("Intn")
    static function intn(n: go.GoInt): go.GoInt;

    @:go.native("NormFloat64")
    static function normFloat64(): go.Float64;

    @:go.native("Uint32")
    static function uint32(): go.UInt32;

    @:go.native("Uint64")
    static function uint64(): go.UInt64;

}
