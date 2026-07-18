package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract Rune {
   @:op(A + B) private function add(other: Rune): Rune;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Rune {
       return this + Go.rune(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Rune {
       return this + Go.rune(other);
   }
   @:op(A - B) private function sub(other: Rune): Rune;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: Rune): Rune {
       return Go.rune(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Rune, b: Float): Rune {
       return a - Go.rune(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: Rune): Rune {
       return Go.rune(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: Rune, b: Int): Rune {
       return a - Go.rune(b);
   }
   @:op(A * B) private function mul(other: Rune): Rune;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Rune {
       return this * Go.rune(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Rune {
       return this * Go.rune(other);
   }
   @:op(A / B) private function div(other: Rune): Rune;
   @:op(A / B) private inline static function hx_div_a(a: Float, b: Rune): Rune {
       return Go.rune(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Rune, b: Float): Rune {
       return a / Go.rune(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: Rune): Rune {
       return Go.rune(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: Rune, b: Int): Rune {
       return a / Go.rune(b);
   }
   @:op(A % B) private function mod(other: Rune): Rune;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: Rune): Rune {
       return Go.rune(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Rune, b: Float): Rune {
       return a % Go.rune(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: Rune): Rune {
       return Go.rune(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: Rune, b: Int): Rune {
       return a % Go.rune(b);
   }
   @:op(-A) private function neg(): Rune;
   @:op(++A) private function preinc(): Rune;
   @:op(A++) private function postinc(): Rune;
   @:op(--A) private function predec(): Rune;
   @:op(A--) private function postdec(): Rune;
   @:op(A == B) private function eq(other: Rune): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return Go.float64(this) == other;
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.rune(other);
   }
   @:op(A != B) private function neq(other: Rune): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return Go.float64(this) != other;
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.rune(other);
   }
   @:op(A < B) private function lt(other: Rune): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: Rune): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_b(a: Rune, b: Float): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: Rune): Bool {
       return Go.rune(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: Rune, b: Int): Bool {
       return a < Go.rune(b);
   }
   @:op(A <= B) private function lte(other: Rune): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Rune): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Rune, b: Float): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Rune): Bool {
       return Go.rune(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: Rune, b: Int): Bool {
       return a <= Go.rune(b);
   }
   @:op(A > B) private function gt(other: Rune): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: Rune): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_b(a: Rune, b: Float): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: Rune): Bool {
       return Go.rune(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: Rune, b: Int): Bool {
       return a > Go.rune(b);
   }
   @:op(A >= B) private function gte(other: Rune): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Rune): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Rune, b: Float): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Rune): Bool {
       return Go.rune(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: Rune, b: Int): Bool {
       return a >= Go.rune(b);
   }
   @:op(A & B) private function and(other: Rune): Rune;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): Rune {
       return this & Go.rune(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): Rune {
       return this & Go.rune(other);
   }
   @:op(A | B) private function or(other: Rune): Rune;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): Rune {
       return this | Go.rune(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): Rune {
       return this | Go.rune(other);
   }
   @:op(A ^ B) private function xor(other: Rune): Rune;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): Rune {
       return this ^ Go.rune(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): Rune {
       return this ^ Go.rune(other);
   }
   @:op(~A) private function not(): Rune;
   @:op(A << B) private function lshift(other: Rune): Rune;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: Rune): Rune {
       return Go.rune(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: Rune, b: Int): Rune {
       return a << Go.rune(b);
   }
   @:op(A >> B) private function rshift(other: Rune): Rune;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: Rune): Rune {
       return Go.rune(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: Rune, b: Int): Rune {
       return a >> Go.rune(b);
   }
   @:op(A >>> B) private function urshift(other: Rune): Rune;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: Rune): Rune {
       return Go.rune(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: Rune, b: Int): Rune {
       return a >>> Go.rune(b);
   }
   @:from public static inline function fromInt(x: Int): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromInt8(x: Int8): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromInt16(x: Int16): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromInt64(x: Int64): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromComplex64(x: Complex64): Rune {
       return Go.rune(x);
   }
   @:from public static inline function fromComplex128(x: Complex128): Rune {
       return Go.rune(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}