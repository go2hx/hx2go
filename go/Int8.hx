package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int8 {
   @:op(A + B) private function add(other: Int8): Int8;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Int8 {
       return this + Go.int8(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Int8 {
       return this + Go.int8(other);
   }
   @:op(A - B) private function sub(other: Int8): Int8;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: Int8): Int8 {
       return Go.int8(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Int8, b: Float): Int8 {
       return a - Go.int8(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: Int8): Int8 {
       return Go.int8(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: Int8, b: Int): Int8 {
       return a - Go.int8(b);
   }
   @:op(A * B) private function mul(other: Int8): Int8;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Int8 {
       return this * Go.int8(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Int8 {
       return this * Go.int8(other);
   }
   @:op(A / B) private inline function div(other: Int8): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Float, b: Int8): Float64 {
       return Go.int8(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Int8, b: Float): Float64 {
       return a / Go.int8(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: Int8): Float64 {
       return Go.int8(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: Int8, b: Int): Float64 {
       return a / Go.int8(b);
   }
   @:op(A % B) private function mod(other: Int8): Int8;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: Int8): Int8 {
       return Go.int8(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Int8, b: Float): Int8 {
       return a % Go.int8(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: Int8): Int8 {
       return Go.int8(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: Int8, b: Int): Int8 {
       return a % Go.int8(b);
   }
   @:op(-A) private function neg(): Int8;
   @:op(++A) private function preinc(): Int8;
   @:op(A++) private function postinc(): Int8;
   @:op(--A) private function predec(): Int8;
   @:op(A--) private function postdec(): Int8;
   @:op(A == B) private function eq(other: Int8): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return this == Go.int8(other);
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.int8(other);
   }
   @:op(A != B) private function neq(other: Int8): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return this != Go.int8(other);
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.int8(other);
   }
   @:op(A < B) private function lt(other: Int8): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: Int8): Bool {
       return Go.int8(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: Int8, b: Float): Bool {
       return a < Go.int8(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: Int8): Bool {
       return Go.int8(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: Int8, b: Int): Bool {
       return a < Go.int8(b);
   }
   @:op(A <= B) private function lte(other: Int8): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Int8): Bool {
       return Go.int8(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Int8, b: Float): Bool {
       return a <= Go.int8(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Int8): Bool {
       return Go.int8(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: Int8, b: Int): Bool {
       return a <= Go.int8(b);
   }
   @:op(A > B) private function gt(other: Int8): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: Int8): Bool {
       return Go.int8(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: Int8, b: Float): Bool {
       return a > Go.int8(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: Int8): Bool {
       return Go.int8(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: Int8, b: Int): Bool {
       return a > Go.int8(b);
   }
   @:op(A >= B) private function gte(other: Int8): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Int8): Bool {
       return Go.int8(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Int8, b: Float): Bool {
       return a >= Go.int8(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Int8): Bool {
       return Go.int8(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: Int8, b: Int): Bool {
       return a >= Go.int8(b);
   }
   @:op(A & B) private function and(other: Int8): Int8;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): Int8 {
       return this & Go.int8(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): Int8 {
       return this & Go.int8(other);
   }
   @:op(A | B) private function or(other: Int8): Int8;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): Int8 {
       return this | Go.int8(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): Int8 {
       return this | Go.int8(other);
   }
   @:op(A ^ B) private function xor(other: Int8): Int8;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): Int8 {
       return this ^ Go.int8(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): Int8 {
       return this ^ Go.int8(other);
   }
   @:op(~A) private function not(): Int8;
   @:op(A << B) private function lshift(other: Int8): Int8;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: Int8): Int8 {
       return Go.int8(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: Int8, b: Int): Int8 {
       return a << Go.int8(b);
   }
   @:op(A >> B) private function rshift(other: Int8): Int8;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: Int8): Int8 {
       return Go.int8(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: Int8, b: Int): Int8 {
       return a >> Go.int8(b);
   }
   @:op(A >>> B) private function urshift(other: Int8): Int8;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: Int8): Int8 {
       return Go.int8(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: Int8, b: Int): Int8 {
       return a >>> Go.int8(b);
   }
   @:from public static inline function fromInt(x: Int): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromGoUInt(x: GoUInt): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromInt16(x: Int16): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromInt32(x: Int32): Int8 {
       return Go.int8(x);
   }
   @:from public static inline function fromInt64(x: Int64): Int8 {
       return Go.int8(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}