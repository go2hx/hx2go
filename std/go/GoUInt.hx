package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract GoUInt {
   @:op(A + B) private function add(other: GoUInt): GoUInt;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): GoUInt {
       return this + Go.uint(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): GoUInt {
       return this + Go.uint(other);
   }
   @:op(A - B) private function sub(other: GoUInt): GoUInt;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: GoUInt): GoUInt {
       return Go.uint(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: GoUInt, b: Float): GoUInt {
       return a - Go.uint(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: GoUInt): GoUInt {
       return Go.uint(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: GoUInt, b: Int): GoUInt {
       return a - Go.uint(b);
   }
   @:op(A * B) private function mul(other: GoUInt): GoUInt;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): GoUInt {
       return this * Go.uint(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): GoUInt {
       return this * Go.uint(other);
   }
   @:op(A / B) private inline function div(other: GoUInt): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Float, b: GoUInt): Float64 {
       return Go.uint(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: GoUInt, b: Float): Float64 {
       return a / Go.uint(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: GoUInt): Float64 {
       return Go.uint(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: GoUInt, b: Int): Float64 {
       return a / Go.uint(b);
   }
   @:op(A % B) private function mod(other: GoUInt): GoUInt;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: GoUInt): GoUInt {
       return Go.uint(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: GoUInt, b: Float): GoUInt {
       return a % Go.uint(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: GoUInt): GoUInt {
       return Go.uint(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: GoUInt, b: Int): GoUInt {
       return a % Go.uint(b);
   }
   @:op(-A) private function neg(): GoUInt;
   @:op(++A) private function preinc(): GoUInt;
   @:op(A++) private function postinc(): GoUInt;
   @:op(--A) private function predec(): GoUInt;
   @:op(A--) private function postdec(): GoUInt;
   @:op(A == B) private function eq(other: GoUInt): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return Go.float64(this) == other;
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.uint(other);
   }
   @:op(A != B) private function neq(other: GoUInt): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return Go.float64(this) != other;
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.uint(other);
   }
   @:op(A < B) private function lt(other: GoUInt): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: GoUInt): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_b(a: GoUInt, b: Float): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: GoUInt): Bool {
       return Go.uint(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: GoUInt, b: Int): Bool {
       return a < Go.uint(b);
   }
   @:op(A <= B) private function lte(other: GoUInt): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: GoUInt): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_b(a: GoUInt, b: Float): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: GoUInt): Bool {
       return Go.uint(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: GoUInt, b: Int): Bool {
       return a <= Go.uint(b);
   }
   @:op(A > B) private function gt(other: GoUInt): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: GoUInt): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_b(a: GoUInt, b: Float): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: GoUInt): Bool {
       return Go.uint(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: GoUInt, b: Int): Bool {
       return a > Go.uint(b);
   }
   @:op(A >= B) private function gte(other: GoUInt): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: GoUInt): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_b(a: GoUInt, b: Float): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: GoUInt): Bool {
       return Go.uint(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: GoUInt, b: Int): Bool {
       return a >= Go.uint(b);
   }
   @:op(A & B) private function and(other: GoUInt): GoUInt;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): GoUInt {
       return this & Go.uint(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): GoUInt {
       return this & Go.uint(other);
   }
   @:op(A | B) private function or(other: GoUInt): GoUInt;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): GoUInt {
       return this | Go.uint(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): GoUInt {
       return this | Go.uint(other);
   }
   @:op(A ^ B) private function xor(other: GoUInt): GoUInt;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): GoUInt {
       return this ^ Go.uint(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): GoUInt {
       return this ^ Go.uint(other);
   }
   @:op(~A) private function not(): GoUInt;
   @:op(A << B) private function lshift(other: GoUInt): GoUInt;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: GoUInt): GoUInt {
       return Go.uint(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: GoUInt, b: Int): GoUInt {
       return a << Go.uint(b);
   }
   @:op(A >> B) private function rshift(other: GoUInt): GoUInt;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: GoUInt): GoUInt {
       return Go.uint(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: GoUInt, b: Int): GoUInt {
       return a >> Go.uint(b);
   }
   @:op(A >>> B) private function urshift(other: GoUInt): GoUInt;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: GoUInt): GoUInt {
       return Go.uint(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: GoUInt, b: Int): GoUInt {
       return a >>> Go.uint(b);
   }
   @:from public static inline function fromInt(x: Int): GoUInt {
       return Go.uint(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): GoUInt {
       return Go.uint(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): GoUInt {
       return Go.uint(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): GoUInt {
       return Go.uint(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): GoUInt {
       return Go.uint(x);
   }
   @:from public static inline function fromInt8(x: Int8): GoUInt {
       return Go.uint(x);
   }
   @:from public static inline function fromInt16(x: Int16): GoUInt {
       return Go.uint(x);
   }
   @:from public static inline function fromInt64(x: Int64): GoUInt {
       return Go.uint(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}