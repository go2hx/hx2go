package go.math;

@:pure
@:go.TypeAccess({ name: "rand", imports: ["math/rand"]  })
extern class Rand {

    // TODO: this extern is incomplete - https://pkg.go.dev/math/rand

    static function expFloat64(): go.Float64;
    static function float32(): go.Float32;
    static function float64(): go.Float64;
    static function int(): go.GoInt;
    static function int31(): go.Int32;
    static function int31n(n: go.Int32): go.Int32;
    static function int63(): go.Int64;
    static function int63n(n: go.Int64): go.Int64;
    static function intn(n: go.GoInt): go.GoInt;
    static function normFloat64(): go.Float64;
    static function uint32(): go.UInt32;
    static function uint64(): go.UInt64;

}
