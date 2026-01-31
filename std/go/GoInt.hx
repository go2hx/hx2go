package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract GoInt {
   @:op(A + B) private function add(other: GoInt): GoInt;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): GoInt {
       return this + Go.int(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): GoInt {
       return this + Go.int(other);
   }
   @:op(A - B) private function sub(other: GoInt): GoInt;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: GoInt): GoInt {
       return Go.int(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: GoInt, b: Float): GoInt {
       return a - Go.int(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: GoInt): GoInt {
       return Go.int(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: GoInt, b: Int): GoInt {
       return a - Go.int(b);
   }
   @:op(A * B) private function mul(other: GoInt): GoInt;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): GoInt {
       return this * Go.int(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): GoInt {
       return this * Go.int(other);
   }
   @:op(A / B) private inline function div(other: GoInt): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Float, b: GoInt): Float64 {
       return Go.int(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: GoInt, b: Float): Float64 {
       return a / Go.int(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: GoInt): Float64 {
       return Go.int(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: GoInt, b: Int): Float64 {
       return a / Go.int(b);
   }
   @:op(A % B) private function mod(other: GoInt): GoInt;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: GoInt): GoInt {
       return Go.int(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: GoInt, b: Float): GoInt {
       return a % Go.int(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: GoInt): GoInt {
       return Go.int(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: GoInt, b: Int): GoInt {
       return a % Go.int(b);
   }
   @:op(-A) private function neg(): GoInt;
   @:op(++A) private function preinc(): GoInt;
   @:op(A++) private function postinc(): GoInt;
   @:op(--A) private function predec(): GoInt;
   @:op(A--) private function postdec(): GoInt;
   @:op(A == B) private function eq(other: GoInt): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return Go.float64(this) == other;
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.int(other);
   }
   @:op(A != B) private function neq(other: GoInt): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return Go.float64(this) != other;
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.int(other);
   }
   @:op(A < B) private function lt(other: GoInt): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: GoInt): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_b(a: GoInt, b: Float): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: GoInt): Bool {
       return Go.int(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: GoInt, b: Int): Bool {
       return a < Go.int(b);
   }
   @:op(A <= B) private function lte(other: GoInt): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: GoInt): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_b(a: GoInt, b: Float): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: GoInt): Bool {
       return Go.int(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: GoInt, b: Int): Bool {
       return a <= Go.int(b);
   }
   @:op(A > B) private function gt(other: GoInt): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: GoInt): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_b(a: GoInt, b: Float): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: GoInt): Bool {
       return Go.int(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: GoInt, b: Int): Bool {
       return a > Go.int(b);
   }
   @:op(A >= B) private function gte(other: GoInt): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: GoInt): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_b(a: GoInt, b: Float): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: GoInt): Bool {
       return Go.int(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: GoInt, b: Int): Bool {
       return a >= Go.int(b);
   }
   @:op(A & B) private function and(other: GoInt): GoInt;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): GoInt {
       return this & Go.int(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): GoInt {
       return this & Go.int(other);
   }
   @:op(A | B) private function or(other: GoInt): GoInt;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): GoInt {
       return this | Go.int(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): GoInt {
       return this | Go.int(other);
   }
   @:op(A ^ B) private function xor(other: GoInt): GoInt;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): GoInt {
       return this ^ Go.int(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): GoInt {
       return this ^ Go.int(other);
   }
   @:op(~A) private function not(): GoInt;
   @:op(A << B) private function lshift(other: GoInt): GoInt;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: GoInt): GoInt {
       return Go.int(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: GoInt, b: Int): GoInt {
       return a << Go.int(b);
   }
   @:op(A >> B) private function rshift(other: GoInt): GoInt;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: GoInt): GoInt {
       return Go.int(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: GoInt, b: Int): GoInt {
       return a >> Go.int(b);
   }
   @:op(A >>> B) private function urshift(other: GoInt): GoInt;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: GoInt): GoInt {
       return Go.int(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: GoInt, b: Int): GoInt {
       return a >>> Go.int(b);
   }
   @:from public static inline function fromInt(x: Int): GoInt {
       return Go.int(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): GoInt {
       return Go.int(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): GoInt {
       return Go.int(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): GoInt {
       return Go.int(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): GoInt {
       return Go.int(x);
   }
   @:from public static inline function fromInt8(x: Int8): GoInt {
       return Go.int(x);
   }
   @:from public static inline function fromInt16(x: Int16): GoInt {
       return Go.int(x);
   }
   @:from public static inline function fromInt64(x: Int64): GoInt {
       return Go.int(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}