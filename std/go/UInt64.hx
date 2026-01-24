package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract UInt64 {
   @:op(A + B) private function add(other: UInt64): UInt64;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): UInt64 {
       return this + Go.uint64(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): UInt64 {
       return this + Go.uint64(other);
   }
   @:op(A - B) private function sub(other: UInt64): UInt64;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: UInt64): UInt64 {
       return Go.uint64(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: UInt64, b: Float): UInt64 {
       return a - Go.uint64(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: UInt64): UInt64 {
       return Go.uint64(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: UInt64, b: Int): UInt64 {
       return a - Go.uint64(b);
   }
   @:op(A * B) private function mul(other: UInt64): UInt64;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): UInt64 {
       return this * Go.uint64(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): UInt64 {
       return this * Go.uint64(other);
   }
   @:op(A / B) private inline function div(other: UInt64): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Float, b: UInt64): Float64 {
       return Go.uint64(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: UInt64, b: Float): Float64 {
       return a / Go.uint64(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: UInt64): Float64 {
       return Go.uint64(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: UInt64, b: Int): Float64 {
       return a / Go.uint64(b);
   }
   @:op(A % B) private function mod(other: UInt64): UInt64;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: UInt64): UInt64 {
       return Go.uint64(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: UInt64, b: Float): UInt64 {
       return a % Go.uint64(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: UInt64): UInt64 {
       return Go.uint64(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: UInt64, b: Int): UInt64 {
       return a % Go.uint64(b);
   }
   @:op(-A) private function neg(): UInt64;
   @:op(++A) private function preinc(): UInt64;
   @:op(A++) private function postinc(): UInt64;
   @:op(--A) private function predec(): UInt64;
   @:op(A--) private function postdec(): UInt64;
   @:op(A == B) private function eq(other: UInt64): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return this == Go.uint64(other);
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.uint64(other);
   }
   @:op(A != B) private function neq(other: UInt64): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return this != Go.uint64(other);
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.uint64(other);
   }
   @:op(A < B) private function lt(other: UInt64): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: UInt64): Bool {
       return Go.uint64(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: UInt64, b: Float): Bool {
       return a < Go.uint64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: UInt64): Bool {
       return Go.uint64(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: UInt64, b: Int): Bool {
       return a < Go.uint64(b);
   }
   @:op(A <= B) private function lte(other: UInt64): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: UInt64): Bool {
       return Go.uint64(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: UInt64, b: Float): Bool {
       return a <= Go.uint64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: UInt64): Bool {
       return Go.uint64(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: UInt64, b: Int): Bool {
       return a <= Go.uint64(b);
   }
   @:op(A > B) private function gt(other: UInt64): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: UInt64): Bool {
       return Go.uint64(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: UInt64, b: Float): Bool {
       return a > Go.uint64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: UInt64): Bool {
       return Go.uint64(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: UInt64, b: Int): Bool {
       return a > Go.uint64(b);
   }
   @:op(A >= B) private function gte(other: UInt64): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: UInt64): Bool {
       return Go.uint64(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: UInt64, b: Float): Bool {
       return a >= Go.uint64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: UInt64): Bool {
       return Go.uint64(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: UInt64, b: Int): Bool {
       return a >= Go.uint64(b);
   }
   @:op(A & B) private function and(other: UInt64): UInt64;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): UInt64 {
       return this & Go.uint64(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): UInt64 {
       return this & Go.uint64(other);
   }
   @:op(A | B) private function or(other: UInt64): UInt64;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): UInt64 {
       return this | Go.uint64(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): UInt64 {
       return this | Go.uint64(other);
   }
   @:op(A ^ B) private function xor(other: UInt64): UInt64;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): UInt64 {
       return this ^ Go.uint64(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): UInt64 {
       return this ^ Go.uint64(other);
   }
   @:op(~A) private function not(): UInt64;
   @:op(A << B) private function lshift(other: UInt64): UInt64;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: UInt64): UInt64 {
       return Go.uint64(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: UInt64, b: Int): UInt64 {
       return a << Go.uint64(b);
   }
   @:op(A >> B) private function rshift(other: UInt64): UInt64;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: UInt64): UInt64 {
       return Go.uint64(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: UInt64, b: Int): UInt64 {
       return a >> Go.uint64(b);
   }
   @:op(A >>> B) private function urshift(other: UInt64): UInt64;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: UInt64): UInt64 {
       return Go.uint64(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: UInt64, b: Int): UInt64 {
       return a >>> Go.uint64(b);
   }
   @:from public static inline function fromInt(x: Int): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromGoUInt(x: GoUInt): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromInt8(x: Int8): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromInt16(x: Int16): UInt64 {
       return Go.uint64(x);
   }
   @:from public static inline function fromInt32(x: Int32): UInt64 {
       return Go.uint64(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}