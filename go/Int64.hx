package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int64 {
   @:op(A + B) private function add(other: Int64): Int64;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Int64 {
       return this + Go.int64(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Int64 {
       return this + Go.int64(other);
   }
   @:op(A - B) private function sub(other: Int64): Int64;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: Int64): Int64 {
       return Go.int64(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Int64, b: Float): Int64 {
       return a - Go.int64(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: Int64): Int64 {
       return Go.int64(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: Int64, b: Int): Int64 {
       return a - Go.int64(b);
   }
   @:op(A * B) private function mul(other: Int64): Int64;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Int64 {
       return this * Go.int64(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Int64 {
       return this * Go.int64(other);
   }
   @:op(A / B) private inline function div(other: Int64): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Float, b: Int64): Float64 {
       return Go.int64(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Int64, b: Float): Float64 {
       return a / Go.int64(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: Int64): Float64 {
       return Go.int64(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: Int64, b: Int): Float64 {
       return a / Go.int64(b);
   }
   @:op(A % B) private function mod(other: Int64): Int64;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: Int64): Int64 {
       return Go.int64(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Int64, b: Float): Int64 {
       return a % Go.int64(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: Int64): Int64 {
       return Go.int64(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: Int64, b: Int): Int64 {
       return a % Go.int64(b);
   }
   @:op(-A) private function neg(): Int64;
   @:op(++A) private function preinc(): Int64;
   @:op(A++) private function postinc(): Int64;
   @:op(--A) private function predec(): Int64;
   @:op(A--) private function postdec(): Int64;
   @:op(A == B) private function eq(other: Int64): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return this == Go.int64(other);
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.int64(other);
   }
   @:op(A != B) private function neq(other: Int64): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return this != Go.int64(other);
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.int64(other);
   }
   @:op(A < B) private function lt(other: Int64): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: Int64): Bool {
       return Go.int64(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: Int64, b: Float): Bool {
       return a < Go.int64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: Int64): Bool {
       return Go.int64(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: Int64, b: Int): Bool {
       return a < Go.int64(b);
   }
   @:op(A <= B) private function lte(other: Int64): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Int64): Bool {
       return Go.int64(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Int64, b: Float): Bool {
       return a <= Go.int64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Int64): Bool {
       return Go.int64(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: Int64, b: Int): Bool {
       return a <= Go.int64(b);
   }
   @:op(A > B) private function gt(other: Int64): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: Int64): Bool {
       return Go.int64(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: Int64, b: Float): Bool {
       return a > Go.int64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: Int64): Bool {
       return Go.int64(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: Int64, b: Int): Bool {
       return a > Go.int64(b);
   }
   @:op(A >= B) private function gte(other: Int64): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Int64): Bool {
       return Go.int64(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Int64, b: Float): Bool {
       return a >= Go.int64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Int64): Bool {
       return Go.int64(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: Int64, b: Int): Bool {
       return a >= Go.int64(b);
   }
   @:op(A & B) private function and(other: Int64): Int64;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): Int64 {
       return this & Go.int64(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): Int64 {
       return this & Go.int64(other);
   }
   @:op(A | B) private function or(other: Int64): Int64;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): Int64 {
       return this | Go.int64(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): Int64 {
       return this | Go.int64(other);
   }
   @:op(A ^ B) private function xor(other: Int64): Int64;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): Int64 {
       return this ^ Go.int64(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): Int64 {
       return this ^ Go.int64(other);
   }
   @:op(~A) private function not(): Int64;
   @:op(A << B) private function lshift(other: Int64): Int64;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: Int64): Int64 {
       return Go.int64(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: Int64, b: Int): Int64 {
       return a << Go.int64(b);
   }
   @:op(A >> B) private function rshift(other: Int64): Int64;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: Int64): Int64 {
       return Go.int64(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: Int64, b: Int): Int64 {
       return a >> Go.int64(b);
   }
   @:op(A >>> B) private function urshift(other: Int64): Int64;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: Int64): Int64 {
       return Go.int64(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: Int64, b: Int): Int64 {
       return a >>> Go.int64(b);
   }
   @:from public static inline function fromInt(x: Int): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromGoUInt(x: GoUInt): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromInt8(x: Int8): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromInt16(x: Int16): Int64 {
       return Go.int64(x);
   }
   @:from public static inline function fromInt32(x: Int32): Int64 {
       return Go.int64(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}