package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int16 {
   @:op(A + B) private function add(other: Int16): Int16;
   @:op(A + B) @:commutative private inline function hx_add(other: Int): Int16 {
       return this + (other:Int16);
   }
   @:op(A - B) private function sub(other: Int16): Int16;
   @:op(A - B) private inline static function hx_sub_a(a: Int, b: Int16): Int16 {
       return (a:Int16) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Int16, b: Int): Int16 {
       return a - (b:Int16);
   }
   @:op(A * B) private function mul(other: Int16): Int16;
   @:op(A * B) @:commutative private inline function hx_mul(other: Int): Int16 {
       return this * (other:Int16);
   }
   @:op(A / B) private inline function div(other: Int16): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Int, b: Int16): Float64 {
       return (a:Int16) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Int16, b: Int): Float64 {
       return a / (b:Int16);
   }
   @:op(A % B) private function mod(other: Int16): Int16;
   @:op(A % B) private inline static function hx_mod_a(a: Int, b: Int16): Int16 {
       return (a:Int16) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Int16, b: Int): Int16 {
       return a % (b:Int16);
   }
   @:op(-A) private function neg(): Int16;
   @:op(++A) private function preinc(): Int16;
   @:op(A++) private function postinc(): Int16;
   @:op(--A) private function predec(): Int16;
   @:op(A--) private function postdec(): Int16;
   @:op(A == B) private function eq(other: Int16): Bool;
   @:op(A == B) @:commutative private inline function hx_eq(other: Int): Bool {
       return this == (other:Int16);
   }
   @:op(A != B) private function neq(other: Int16): Bool;
   @:op(A != B) @:commutative private inline function hx_neq(other: Int): Bool {
       return this != (other:Int16);
   }
   @:op(A < B) private function lt(other: Int16): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Int, b: Int16): Bool {
       return (a:Int16) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: Int16, b: Int): Bool {
       return a < (b:Int16);
   }
   @:op(A <= B) private function lte(other: Int16): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Int, b: Int16): Bool {
       return (a:Int16) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Int16, b: Int): Bool {
       return a <= (b:Int16);
   }
   @:op(A > B) private function gt(other: Int16): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Int, b: Int16): Bool {
       return (a:Int16) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: Int16, b: Int): Bool {
       return a > (b:Int16);
   }
   @:op(A >= B) private function gte(other: Int16): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Int, b: Int16): Bool {
       return (a:Int16) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Int16, b: Int): Bool {
       return a >= (b:Int16);
   }
   @:op(A & B) private function and(other: Int16): Int16;
   @:op(A & B) @:commutative private inline function hx_and(other: Int): Int16 {
       return this & (other:Int16);
   }
   @:op(A | B) private function or(other: Int16): Int16;
   @:op(A | B) @:commutative private inline function hx_or(other: Int): Int16 {
       return this | (other:Int16);
   }
   @:op(A ^ B) private function xor(other: Int16): Int16;
   @:op(A ^ B) @:commutative private inline function hx_xor(other: Int): Int16 {
       return this ^ (other:Int16);
   }
   @:op(~A) private function not(): Int16;
   @:op(A << B) private function lshift(other: Int16): Int16;
   @:op(A << B) private inline static function hx_lshift_a(a: Int, b: Int16): Int16 {
       return (a:Int16) << b;
   }
   @:op(A << B) private inline static function hx_lshift_b(a: Int16, b: Int): Int16 {
       return a << (b:Int16);
   }
   @:op(A >> B) private function rshift(other: Int16): Int16;
   @:op(A >> B) private inline static function hx_rshift_a(a: Int, b: Int16): Int16 {
       return (a:Int16) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_b(a: Int16, b: Int): Int16 {
       return a >> (b:Int16);
   }
   @:op(A >>> B) private function urshift(other: Int16): Int16;
   @:op(A >>> B) private inline static function hx_urshift_a(a: Int, b: Int16): Int16 {
       return (a:Int16) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_b(a: Int16, b: Int): Int16 {
       return a >>> (b:Int16);
   }
   @:from public static inline function fromInt(x: Int): Int16 {
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