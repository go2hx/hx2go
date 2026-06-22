package go.math;

@:pure
@:go.Type({ name: "rand", imports: ["math/rand"]  })
extern class Rand {
    static function expFloat64(): Float64;
    static function float32(): Float32;
    static function float64(): Float64;
    static function int(): GoInt;
    static function int31(): Int32;
    static function int31n(n: Int32): Int32;
    static function int63(): Int64;
    static function int63n(n: Int64): Int64;
    static function intn(n: GoInt): GoInt;
    static function normFloat64(): Float64;
    static function uint32(): UInt32;
    static function uint64(): UInt64;
}