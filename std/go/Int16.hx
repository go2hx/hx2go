package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract Int16 {
   @:op(A + B) private function add(other: Int16): Int16;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Int16 {
       return this + Go.int16(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Int16 {
       return this + Go.int16(other);
   }
   @:op(A - B) private function sub(other: Int16): Int16;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: Int16): Int16 {
       return Go.int16(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Int16, b: Float): Int16 {
       return a - Go.int16(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: Int16): Int16 {
       return Go.int16(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: Int16, b: Int): Int16 {
       return a - Go.int16(b);
   }
   @:op(A * B) private function mul(other: Int16): Int16;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Int16 {
       return this * Go.int16(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Int16 {
       return this * Go.int16(other);
   }
   @:op(A / B) private inline function div(other: Int16): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Float, b: Int16): Float64 {
       return Go.int16(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Int16, b: Float): Float64 {
       return a / Go.int16(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: Int16): Float64 {
       return Go.int16(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: Int16, b: Int): Float64 {
       return a / Go.int16(b);
   }
   @:op(A % B) private function mod(other: Int16): Int16;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: Int16): Int16 {
       return Go.int16(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Int16, b: Float): Int16 {
       return a % Go.int16(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: Int16): Int16 {
       return Go.int16(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: Int16, b: Int): Int16 {
       return a % Go.int16(b);
   }
   @:op(-A) private function neg(): Int16;
   @:op(++A) private function preinc(): Int16;
   @:op(A++) private function postinc(): Int16;
   @:op(--A) private function predec(): Int16;
   @:op(A--) private function postdec(): Int16;
   @:op(A == B) private function eq(other: Int16): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return Go.float64(this) == other;
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.int16(other);
   }
   @:op(A != B) private function neq(other: Int16): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return Go.float64(this) != other;
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.int16(other);
   }
   @:op(A < B) private function lt(other: Int16): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: Int16): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_b(a: Int16, b: Float): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: Int16): Bool {
       return Go.int16(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: Int16, b: Int): Bool {
       return a < Go.int16(b);
   }
   @:op(A <= B) private function lte(other: Int16): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Int16): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Int16, b: Float): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Int16): Bool {
       return Go.int16(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: Int16, b: Int): Bool {
       return a <= Go.int16(b);
   }
   @:op(A > B) private function gt(other: Int16): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: Int16): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_b(a: Int16, b: Float): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: Int16): Bool {
       return Go.int16(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: Int16, b: Int): Bool {
       return a > Go.int16(b);
   }
   @:op(A >= B) private function gte(other: Int16): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Int16): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Int16, b: Float): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Int16): Bool {
       return Go.int16(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: Int16, b: Int): Bool {
       return a >= Go.int16(b);
   }
   @:op(A & B) private function and(other: Int16): Int16;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): Int16 {
       return this & Go.int16(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): Int16 {
       return this & Go.int16(other);
   }
   @:op(A | B) private function or(other: Int16): Int16;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): Int16 {
       return this | Go.int16(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): Int16 {
       return this | Go.int16(other);
   }
   @:op(A ^ B) private function xor(other: Int16): Int16;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): Int16 {
       return this ^ Go.int16(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): Int16 {
       return this ^ Go.int16(other);
   }
   @:op(~A) private function not(): Int16;
   @:op(A << B) private function lshift(other: Int16): Int16;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: Int16): Int16 {
       return Go.int16(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: Int16, b: Int): Int16 {
       return a << Go.int16(b);
   }
   @:op(A >> B) private function rshift(other: Int16): Int16;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: Int16): Int16 {
       return Go.int16(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: Int16, b: Int): Int16 {
       return a >> Go.int16(b);
   }
   @:op(A >>> B) private function urshift(other: Int16): Int16;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: Int16): Int16 {
       return Go.int16(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: Int16, b: Int): Int16 {
       return a >>> Go.int16(b);
   }
   @:from public static inline function fromInt(x: Int): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromGoUInt(x: GoUInt): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromInt8(x: Int8): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromInt32(x: Int32): Int16 {
       return Go.int16(x);
   }
   @:from public static inline function fromInt64(x: Int64): Int16 {
       return Go.int16(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}