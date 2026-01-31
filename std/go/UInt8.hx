package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract UInt8 {
   @:op(A + B) private function add(other: UInt8): UInt8;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): UInt8 {
       return this + Go.uint8(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): UInt8 {
       return this + Go.uint8(other);
   }
   @:op(A - B) private function sub(other: UInt8): UInt8;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: UInt8): UInt8 {
       return Go.uint8(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: UInt8, b: Float): UInt8 {
       return a - Go.uint8(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: UInt8): UInt8 {
       return Go.uint8(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: UInt8, b: Int): UInt8 {
       return a - Go.uint8(b);
   }
   @:op(A * B) private function mul(other: UInt8): UInt8;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): UInt8 {
       return this * Go.uint8(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): UInt8 {
       return this * Go.uint8(other);
   }
   @:op(A / B) private inline function div(other: UInt8): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Float, b: UInt8): Float64 {
       return Go.uint8(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: UInt8, b: Float): Float64 {
       return a / Go.uint8(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: UInt8): Float64 {
       return Go.uint8(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: UInt8, b: Int): Float64 {
       return a / Go.uint8(b);
   }
   @:op(A % B) private function mod(other: UInt8): UInt8;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: UInt8): UInt8 {
       return Go.uint8(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: UInt8, b: Float): UInt8 {
       return a % Go.uint8(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: UInt8): UInt8 {
       return Go.uint8(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: UInt8, b: Int): UInt8 {
       return a % Go.uint8(b);
   }
   @:op(-A) private function neg(): UInt8;
   @:op(++A) private function preinc(): UInt8;
   @:op(A++) private function postinc(): UInt8;
   @:op(--A) private function predec(): UInt8;
   @:op(A--) private function postdec(): UInt8;
   @:op(A == B) private function eq(other: UInt8): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return Go.float64(this) == other;
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.uint8(other);
   }
   @:op(A != B) private function neq(other: UInt8): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return Go.float64(this) != other;
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.uint8(other);
   }
   @:op(A < B) private function lt(other: UInt8): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: UInt8): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_b(a: UInt8, b: Float): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: UInt8): Bool {
       return Go.uint8(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: UInt8, b: Int): Bool {
       return a < Go.uint8(b);
   }
   @:op(A <= B) private function lte(other: UInt8): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: UInt8): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_b(a: UInt8, b: Float): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: UInt8): Bool {
       return Go.uint8(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: UInt8, b: Int): Bool {
       return a <= Go.uint8(b);
   }
   @:op(A > B) private function gt(other: UInt8): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: UInt8): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_b(a: UInt8, b: Float): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: UInt8): Bool {
       return Go.uint8(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: UInt8, b: Int): Bool {
       return a > Go.uint8(b);
   }
   @:op(A >= B) private function gte(other: UInt8): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: UInt8): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_b(a: UInt8, b: Float): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: UInt8): Bool {
       return Go.uint8(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: UInt8, b: Int): Bool {
       return a >= Go.uint8(b);
   }
   @:op(A & B) private function and(other: UInt8): UInt8;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): UInt8 {
       return this & Go.uint8(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): UInt8 {
       return this & Go.uint8(other);
   }
   @:op(A | B) private function or(other: UInt8): UInt8;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): UInt8 {
       return this | Go.uint8(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): UInt8 {
       return this | Go.uint8(other);
   }
   @:op(A ^ B) private function xor(other: UInt8): UInt8;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): UInt8 {
       return this ^ Go.uint8(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): UInt8 {
       return this ^ Go.uint8(other);
   }
   @:op(~A) private function not(): UInt8;
   @:op(A << B) private function lshift(other: UInt8): UInt8;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: UInt8): UInt8 {
       return Go.uint8(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: UInt8, b: Int): UInt8 {
       return a << Go.uint8(b);
   }
   @:op(A >> B) private function rshift(other: UInt8): UInt8;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: UInt8): UInt8 {
       return Go.uint8(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: UInt8, b: Int): UInt8 {
       return a >> Go.uint8(b);
   }
   @:op(A >>> B) private function urshift(other: UInt8): UInt8;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: UInt8): UInt8 {
       return Go.uint8(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: UInt8, b: Int): UInt8 {
       return a >>> Go.uint8(b);
   }
   @:from public static inline function fromInt(x: Int): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromGoUInt(x: GoUInt): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromInt16(x: Int16): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromInt32(x: Int32): UInt8 {
       return Go.uint8(x);
   }
   @:from public static inline function fromInt64(x: Int64): UInt8 {
       return Go.uint8(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}