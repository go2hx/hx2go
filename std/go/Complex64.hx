package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract Complex64 {
    @:op(A + B) private function add(other: Complex64): Complex64;
    @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Complex64 {
        return this + Go.complex64(other);
    }
    @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Complex64 {
        return this + Go.complex64(other);
    }
    @:op(A - B) private function sub(other: Complex64): Complex64;
    @:op(A - B) private inline static function hx_sub_a(a: Float, b: Complex64): Complex64 {
        return Go.complex64(a) - b;
    }
    @:op(A - B) private inline static function hx_sub_b(a: Complex64, b: Float): Complex64 {
        return a - Go.complex64(b);
    }
    @:op(A - B) private inline static function hx_sub_c(a: Int, b: Complex64): Complex64 {
        return Go.complex64(a) - b;
    }
    @:op(A - B) private inline static function hx_sub_d(a: Complex64, b: Int): Complex64 {
        return a - Go.complex64(b);
    }
    @:op(A * B) private function mul(other: Complex64): Complex64;
    @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Complex64 {
        return this * Go.complex64(other);
    }
    @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Complex64 {
        return this * Go.complex64(other);
    }
    @:op(A / B) private function div(other: Complex64): Complex64;
    @:op(A / B) private inline static function hx_div_a(a: Float, b: Complex64): Complex64 {
        return Go.complex64(a) / b;
    }
    @:op(A / B) private inline static function hx_div_b(a: Complex64, b: Float): Complex64 {
        return a / Go.complex64(b);
    }
    @:op(A / B) private inline static function hx_div_c(a: Int, b: Complex64): Complex64 {
        return Go.complex64(a) / b;
    }
    @:op(A / B) private inline static function hx_div_d(a: Complex64, b: Int): Complex64 {
        return a / Go.complex64(b);
    }
    @:op(A % B) private function mod(other: Complex64): Complex64;
    @:op(A % B) private inline static function hx_mod_a(a: Float, b: Complex64): Complex64 {
        return Go.complex64(a) % b;
    }
    @:op(A % B) private inline static function hx_mod_b(a: Complex64, b: Float): Complex64 {
        return a % Go.complex64(b);
    }
    @:op(A % B) private inline static function hx_mod_c(a: Int, b: Complex64): Complex64 {
        return Go.complex64(a) % b;
    }
    @:op(A % B) private inline static function hx_mod_d(a: Complex64, b: Int): Complex64 {
        return a % Go.complex64(b);
    }
    @:op(-A) private function neg(): Complex64;
    @:op(++A) private function preinc(): Complex64;
    @:op(A++) private function postinc(): Complex64;
    @:op(--A) private function predec(): Complex64;
    @:op(A--) private function postdec(): Complex64;
    @:op(A == B) private function eq(other: Complex64): Bool;
    @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
        return Go.complex64(this) == other;
    }
    @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
        return this == Go.complex64(other);
    }
    @:op(A != B) private function neq(other: Complex64): Bool;
    @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
        return Go.complex64(this) != other;
    }
    @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
        return this != Go.complex64(other);
    }
    @:op(A < B) private function lt(other: Complex64): Bool;
    @:op(A < B) private inline static function hx_lt_a(a: Float, b: Complex64): Bool {
        return Go.complex64(a) < Go.complex64(b);
    }
    @:op(A < B) private inline static function hx_lt_b(a: Complex64, b: Float): Bool {
        return Go.complex64(a) < Go.complex64(b);
    }
    @:op(A < B) private inline static function hx_lt_c(a: Int, b: Complex64): Bool {
        return Go.complex64(a) < b;
    }
    @:op(A < B) private inline static function hx_lt_d(a: Complex64, b: Int): Bool {
        return a < Go.complex64(b);
    }
    @:op(A <= B) private function lte(other: Complex64): Bool;
    @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Complex64): Bool {
        return Go.complex64(a) <= Go.complex64(b);
    }
    @:op(A <= B) private inline static function hx_lte_b(a: Complex64, b: Float): Bool {
        return Go.complex64(a) <= Go.complex64(b);
    }
    @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Complex64): Bool {
        return Go.complex64(a) <= b;
    }
    @:op(A <= B) private inline static function hx_lte_d(a: Complex64, b: Int): Bool {
        return a <= Go.complex64(b);
    }
    @:op(A > B) private function gt(other: Complex64): Bool;
    @:op(A > B) private inline static function hx_gt_a(a: Float, b: Complex64): Bool {
        return Go.complex64(a) > Go.complex64(b);
    }
    @:op(A > B) private inline static function hx_gt_b(a: Complex64, b: Float): Bool {
        return Go.complex64(a) > Go.complex64(b);
    }
    @:op(A > B) private inline static function hx_gt_c(a: Int, b: Complex64): Bool {
        return Go.complex64(a) > b;
    }
    @:op(A > B) private inline static function hx_gt_d(a: Complex64, b: Int): Bool {
        return a > Go.complex64(b);
    }
    @:op(A >= B) private function gte(other: Complex64): Bool;
    @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Complex64): Bool {
        return Go.complex64(a) >= Go.complex64(b);
    }
    @:op(A >= B) private inline static function hx_gte_b(a: Complex64, b: Float): Bool {
        return Go.complex64(a) >= Go.complex64(b);
    }
    @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Complex64): Bool {
        return Go.complex64(a) >= b;
    }
    @:op(A >= B) private inline static function hx_gte_d(a: Complex64, b: Int): Bool {
        return a >= Go.complex64(b);
    }
    @:from public static inline function fromInt(x: Int): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromGoInt(x: GoInt): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromGoUInt(x: GoUInt): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromUInt8(x: UInt8): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromUInt16(x: UInt16): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromUInt32(x: UInt32): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromUInt64(x: UInt64): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromInt8(x: Int8): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromInt16(x: Int16): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromInt32(x: Int32): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromInt64(x: Int64): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromByte(x: Byte): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromRune(x: Rune): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromFloat(x: Float): Complex64 {
        return Go.complex64(x);
    }
    @:from public static inline function fromFloat32(x: Float32): Complex64 {
        return Go.complex64(x);
    }
    @:to public inline function toFloat(): Float {
        return (untyped this : Float);
    }
}