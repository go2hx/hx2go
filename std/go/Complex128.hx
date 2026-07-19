package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract Complex128 {
   @:op(A + B) private function add(other: Complex128): Complex128;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Complex128 {
       return this + Go.complex128(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Complex128 {
       return this + Go.complex128(other);
   }
   @:op(A - B) private function sub(other: Complex128): Complex128;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: Complex128): Complex128 {
       return Go.complex128(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Complex128, b: Float): Complex128 {
       return a - Go.complex128(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: Complex128): Complex128 {
       return Go.complex128(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: Complex128, b: Int): Complex128 {
       return a - Go.complex128(b);
   }
   @:op(A * B) private function mul(other: Complex128): Complex128;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Complex128 {
       return this * Go.complex128(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Complex128 {
       return this * Go.complex128(other);
   }
   @:op(A / B) private function div(other: Complex128): Complex128;
   @:op(A / B) private inline static function hx_div_a(a: Float, b: Complex128): Complex128 {
       return Go.complex128(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Complex128, b: Float): Complex128 {
       return a / Go.complex128(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: Complex128): Complex128 {
       return Go.complex128(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: Complex128, b: Int): Complex128 {
       return a / Go.complex128(b);
   }
   @:op(A % B) private function mod(other: Complex128): Complex128;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: Complex128): Complex128 {
       return Go.complex128(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Complex128, b: Float): Complex128 {
       return a % Go.complex128(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: Complex128): Complex128 {
       return Go.complex128(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: Complex128, b: Int): Complex128 {
       return a % Go.complex128(b);
   }
   @:op(-A) private function neg(): Complex128;
   @:op(++A) private function preinc(): Complex128;
   @:op(A++) private function postinc(): Complex128;
   @:op(--A) private function predec(): Complex128;
   @:op(A--) private function postdec(): Complex128;
   @:op(A == B) private function eq(other: Complex128): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return Go.float64(this) == other;
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.complex128(other);
   }
   @:op(A != B) private function neq(other: Complex128): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return Go.float64(this) != other;
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.complex128(other);
   }
   @:op(A < B) private function lt(other: Complex128): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: Complex128): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_b(a: Complex128, b: Float): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: Complex128): Bool {
       return Go.complex128(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: Complex128, b: Int): Bool {
       return a < Go.complex128(b);
   }
   @:op(A <= B) private function lte(other: Complex128): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Complex128): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Complex128, b: Float): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Complex128): Bool {
       return Go.complex128(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: Complex128, b: Int): Bool {
       return a <= Go.complex128(b);
   }
   @:op(A > B) private function gt(other: Complex128): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: Complex128): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_b(a: Complex128, b: Float): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: Complex128): Bool {
       return Go.complex128(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: Complex128, b: Int): Bool {
       return a > Go.complex128(b);
   }
   @:op(A >= B) private function gte(other: Complex128): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Complex128): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Complex128, b: Float): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Complex128): Bool {
       return Go.complex128(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: Complex128, b: Int): Bool {
       return a >= Go.complex128(b);
   }
   @:op(A & B) private function and(other: Complex128): Complex128;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): Complex128 {
       return this & Go.complex128(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): Complex128 {
       return this & Go.complex128(other);
   }
   @:op(A | B) private function or(other: Complex128): Complex128;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): Complex128 {
       return this | Go.complex128(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): Complex128 {
       return this | Go.complex128(other);
   }
   @:op(A ^ B) private function xor(other: Complex128): Complex128;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): Complex128 {
       return this ^ Go.complex128(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): Complex128 {
       return this ^ Go.complex128(other);
   }
   @:op(~A) private function not(): Complex128;
   @:op(A << B) private function lshift(other: Complex128): Complex128;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: Complex128): Complex128 {
       return Go.complex128(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: Complex128, b: Int): Complex128 {
       return a << Go.complex128(b);
   }
   @:op(A >> B) private function rshift(other: Complex128): Complex128;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: Complex128): Complex128 {
       return Go.complex128(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: Complex128, b: Int): Complex128 {
       return a >> Go.complex128(b);
   }
   @:op(A >>> B) private function urshift(other: Complex128): Complex128;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: Complex128): Complex128 {
       return Go.complex128(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: Complex128, b: Int): Complex128 {
       return a >>> Go.complex128(b);
   }
   @:from public static inline function fromInt(x: Int): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromGoUInt(x: GoUInt): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromInt8(x: Int8): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromInt16(x: Int16): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromInt32(x: Int32): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromInt64(x: Int64): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromByte(x: Byte): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromRune(x: Rune): Complex128 {
       return Go.complex128(x);
   }
   @:from public static inline function fromComplex64(x: Complex64): Complex128 {
       return Go.complex128(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}