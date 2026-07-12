package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract Byte {
   @:op(A + B) private function add(other: Byte): Byte;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Byte {
       return this + Go.byte(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Byte {
       return this + Go.byte(other);
   }
   @:op(A - B) private function sub(other: Byte): Byte;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: Byte): Byte {
       return Go.byte(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Byte, b: Float): Byte {
       return a - Go.byte(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: Byte): Byte {
       return Go.byte(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: Byte, b: Int): Byte {
       return a - Go.byte(b);
   }
   @:op(A * B) private function mul(other: Byte): Byte;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Byte {
       return this * Go.byte(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Byte {
       return this * Go.byte(other);
   }
   @:op(A / B) private function div(other: Byte): Byte;
   @:op(A / B) private inline static function hx_div_a(a: Float, b: Byte): Byte {
       return Go.byte(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Byte, b: Float): Byte {
       return a / Go.byte(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: Byte): Byte {
       return Go.byte(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: Byte, b: Int): Byte {
       return a / Go.byte(b);
   }
   @:op(A % B) private function mod(other: Byte): Byte;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: Byte): Byte {
       return Go.byte(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Byte, b: Float): Byte {
       return a % Go.byte(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: Byte): Byte {
       return Go.byte(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: Byte, b: Int): Byte {
       return a % Go.byte(b);
   }
   @:op(-A) private function neg(): Byte;
   @:op(++A) private function preinc(): Byte;
   @:op(A++) private function postinc(): Byte;
   @:op(--A) private function predec(): Byte;
   @:op(A--) private function postdec(): Byte;
   @:op(A == B) private function eq(other: Byte): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return Go.float64(this) == other;
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.byte(other);
   }
   @:op(A != B) private function neq(other: Byte): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return Go.float64(this) != other;
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.byte(other);
   }
   @:op(A < B) private function lt(other: Byte): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: Byte): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_b(a: Byte, b: Float): Bool {
       return Go.float64(a) < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: Byte): Bool {
       return Go.byte(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: Byte, b: Int): Bool {
       return a < Go.byte(b);
   }
   @:op(A <= B) private function lte(other: Byte): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Byte): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Byte, b: Float): Bool {
       return Go.float64(a) <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Byte): Bool {
       return Go.byte(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: Byte, b: Int): Bool {
       return a <= Go.byte(b);
   }
   @:op(A > B) private function gt(other: Byte): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: Byte): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_b(a: Byte, b: Float): Bool {
       return Go.float64(a) > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: Byte): Bool {
       return Go.byte(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: Byte, b: Int): Bool {
       return a > Go.byte(b);
   }
   @:op(A >= B) private function gte(other: Byte): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Byte): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Byte, b: Float): Bool {
       return Go.float64(a) >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Byte): Bool {
       return Go.byte(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: Byte, b: Int): Bool {
       return a >= Go.byte(b);
   }
   @:op(A & B) private function and(other: Byte): Byte;
   @:op(A & B) @:commutative private inline function hx_and_a(other: Float): Byte {
       return this & Go.byte(other);
   }
   @:op(A & B) @:commutative private inline function hx_and_b(other: Int): Byte {
       return this & Go.byte(other);
   }
   @:op(A | B) private function or(other: Byte): Byte;
   @:op(A | B) @:commutative private inline function hx_or_a(other: Float): Byte {
       return this | Go.byte(other);
   }
   @:op(A | B) @:commutative private inline function hx_or_b(other: Int): Byte {
       return this | Go.byte(other);
   }
   @:op(A ^ B) private function xor(other: Byte): Byte;
   @:op(A ^ B) @:commutative private inline function hx_xor_a(other: Float): Byte {
       return this ^ Go.byte(other);
   }
   @:op(A ^ B) @:commutative private inline function hx_xor_b(other: Int): Byte {
       return this ^ Go.byte(other);
   }
   @:op(~A) private function not(): Byte;
   @:op(A << B) private function lshift(other: Byte): Byte;
   @:op(A << B) private inline static function hx_lshift_c(a: Int, b: Byte): Byte {
       return Go.byte(a) << b;
   }
   @:op(A << B) private inline static function hx_lshift_d(a: Byte, b: Int): Byte {
       return a << Go.byte(b);
   }
   @:op(A >> B) private function rshift(other: Byte): Byte;
   @:op(A >> B) private inline static function hx_rshift_c(a: Int, b: Byte): Byte {
       return Go.byte(a) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_d(a: Byte, b: Int): Byte {
       return a >> Go.byte(b);
   }
   @:op(A >>> B) private function urshift(other: Byte): Byte;
   @:op(A >>> B) private inline static function hx_urshift_c(a: Int, b: Byte): Byte {
       return Go.byte(a) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_d(a: Byte, b: Int): Byte {
       return a >>> Go.byte(b);
   }
   @:from public static inline function fromInt(x: Int): Byte {
       return Go.byte(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): Byte {
       return Go.byte(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Byte {
       return Go.byte(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Byte {
       return Go.byte(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): Byte {
       return Go.byte(x);
   }
   @:from public static inline function fromInt8(x: Int8): Byte {
       return Go.byte(x);
   }
   @:from public static inline function fromInt16(x: Int16): Byte {
       return Go.byte(x);
   }
   @:from public static inline function fromInt64(x: Int64): Byte {
       return Go.byte(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}