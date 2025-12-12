package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int64 {
   @:op(A + B) private function add(other: Int64): Int64;
   @:op(A + B) @:commutative private inline function hx_add(other: Int): Int64 {
       return this + (other:Int64);
   }
   @:op(A - B) private function sub(other: Int64): Int64;
   @:op(A - B) private inline static function hx_sub_a(a: Int, b: Int64): Int64 {
       return (a:Int64) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Int64, b: Int): Int64 {
       return a - (b:Int64);
   }
   @:op(A * B) private function mul(other: Int64): Int64;
   @:op(A * B) @:commutative private inline function hx_mul(other: Int): Int64 {
       return this * (other:Int64);
   }
   @:op(A / B) private inline function div(other: Int64): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Int, b: Int64): Float64 {
       return (a:Int64) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Int64, b: Int): Float64 {
       return a / (b:Int64);
   }
   @:op(A % B) private function mod(other: Int64): Int64;
   @:op(A % B) private inline static function hx_mod_a(a: Int, b: Int64): Int64 {
       return (a:Int64) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Int64, b: Int): Int64 {
       return a % (b:Int64);
   }
   @:op(-A) private function neg(): Int64;
   @:op(++A) private function preinc(): Int64;
   @:op(A++) private function postinc(): Int64;
   @:op(--A) private function predec(): Int64;
   @:op(A--) private function postdec(): Int64;
   @:op(A == B) private function eq(other: Int64): Bool;
   @:op(A == B) @:commutative private inline function hx_eq(other: Int): Bool {
       return this == (other:Int64);
   }
   @:op(A != B) private function neq(other: Int64): Bool;
   @:op(A != B) @:commutative private inline function hx_neq(other: Int): Bool {
       return this != (other:Int64);
   }
   @:op(A < B) private function lt(other: Int64): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Int, b: Int64): Bool {
       return (a:Int64) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: Int64, b: Int): Bool {
       return a < (b:Int64);
   }
   @:op(A <= B) private function lte(other: Int64): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Int, b: Int64): Bool {
       return (a:Int64) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Int64, b: Int): Bool {
       return a <= (b:Int64);
   }
   @:op(A > B) private function gt(other: Int64): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Int, b: Int64): Bool {
       return (a:Int64) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: Int64, b: Int): Bool {
       return a > (b:Int64);
   }
   @:op(A >= B) private function gte(other: Int64): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Int, b: Int64): Bool {
       return (a:Int64) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Int64, b: Int): Bool {
       return a >= (b:Int64);
   }
   @:op(A & B) private function and(other: Int64): Int64;
   @:op(A & B) @:commutative private inline function hx_and(other: Int): Int64 {
       return this & (other:Int64);
   }
   @:op(A | B) private function or(other: Int64): Int64;
   @:op(A | B) @:commutative private inline function hx_or(other: Int): Int64 {
       return this | (other:Int64);
   }
   @:op(A ^ B) private function xor(other: Int64): Int64;
   @:op(A ^ B) @:commutative private inline function hx_xor(other: Int): Int64 {
       return this ^ (other:Int64);
   }
   @:op(~A) private function not(): Int64;
   @:op(A << B) private function lshift(other: Int64): Int64;
   @:op(A << B) private inline static function hx_lshift_a(a: Int, b: Int64): Int64 {
       return (a:Int64) << b;
   }
   @:op(A << B) private inline static function hx_lshift_b(a: Int64, b: Int): Int64 {
       return a << (b:Int64);
   }
   @:op(A >> B) private function rshift(other: Int64): Int64;
   @:op(A >> B) private inline static function hx_rshift_a(a: Int, b: Int64): Int64 {
       return (a:Int64) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_b(a: Int64, b: Int): Int64 {
       return a >> (b:Int64);
   }
   @:op(A >>> B) private function urshift(other: Int64): Int64;
   @:op(A >>> B) private inline static function hx_urshift_a(a: Int, b: Int64): Int64 {
       return (a:Int64) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_b(a: Int64, b: Int): Int64 {
       return a >>> (b:Int64);
   }
   @:from public static inline function fromInt(x: Int): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromInt8(x: Int8): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromInt16(x: Int16): Int64 {
       return Convert.int64(x);
   }
   @:from public static inline function fromInt32(x: Int32): Int64 {
       return Convert.int64(x);
   }
   @:to public inline function toFloat(): Float {
       return untyped this;
   }
   @:to public inline function toInt(): Int {
       return untyped this;
   }
}