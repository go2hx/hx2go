package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract Int8 {
   @:op(A + B) private function add(other: Int8): Int8;
   @:op(A + B) @:commutative private inline function hx_add(other: Int): Int8 {
       return this + (other:Int8);
   }
   @:op(A - B) private function sub(other: Int8): Int8;
   @:op(A - B) private inline static function hx_sub_a(a: Int, b: Int8): Int8 {
       return (a:Int8) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Int8, b: Int): Int8 {
       return a - (b:Int8);
   }
   @:op(A * B) private function mul(other: Int8): Int8;
   @:op(A * B) @:commutative private inline function hx_mul(other: Int): Int8 {
       return this * (other:Int8);
   }
   @:op(A / B) private inline function div(other: Int8): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Int, b: Int8): Float64 {
       return (a:Int8) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Int8, b: Int): Float64 {
       return a / (b:Int8);
   }
   @:op(A % B) private function mod(other: Int8): Int8;
   @:op(A % B) private inline static function hx_mod_a(a: Int, b: Int8): Int8 {
       return (a:Int8) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Int8, b: Int): Int8 {
       return a % (b:Int8);
   }
   @:op(-A) private function neg(): Int8;
   @:op(++A) private function preinc(): Int8;
   @:op(A++) private function postinc(): Int8;
   @:op(--A) private function predec(): Int8;
   @:op(A--) private function postdec(): Int8;
   @:op(A == B) private function eq(other: Int8): Bool;
   @:op(A == B) @:commutative private inline function hx_eq(other: Int): Bool {
       return this == (other:Int8);
   }
   @:op(A != B) private function neq(other: Int8): Bool;
   @:op(A != B) @:commutative private inline function hx_neq(other: Int): Bool {
       return this != (other:Int8);
   }
   @:op(A < B) private function lt(other: Int8): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Int, b: Int8): Bool {
       return (a:Int8) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: Int8, b: Int): Bool {
       return a < (b:Int8);
   }
   @:op(A <= B) private function lte(other: Int8): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Int, b: Int8): Bool {
       return (a:Int8) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Int8, b: Int): Bool {
       return a <= (b:Int8);
   }
   @:op(A > B) private function gt(other: Int8): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Int, b: Int8): Bool {
       return (a:Int8) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: Int8, b: Int): Bool {
       return a > (b:Int8);
   }
   @:op(A >= B) private function gte(other: Int8): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Int, b: Int8): Bool {
       return (a:Int8) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Int8, b: Int): Bool {
       return a >= (b:Int8);
   }
   @:op(A & B) private function and(other: Int8): Int8;
   @:op(A & B) @:commutative private inline function hx_and(other: Int): Int8 {
       return this & (other:Int8);
   }
   @:op(A | B) private function or(other: Int8): Int8;
   @:op(A | B) @:commutative private inline function hx_or(other: Int): Int8 {
       return this | (other:Int8);
   }
   @:op(A ^ B) private function xor(other: Int8): Int8;
   @:op(A ^ B) @:commutative private inline function hx_xor(other: Int): Int8 {
       return this ^ (other:Int8);
   }
   @:op(~A) private function not(): Int8;
   @:op(A << B) private function lshift(other: Int8): Int8;
   @:op(A << B) private inline static function hx_lshift_a(a: Int, b: Int8): Int8 {
       return (a:Int8) << b;
   }
   @:op(A << B) private inline static function hx_lshift_b(a: Int8, b: Int): Int8 {
       return a << (b:Int8);
   }
   @:op(A >> B) private function rshift(other: Int8): Int8;
   @:op(A >> B) private inline static function hx_rshift_a(a: Int, b: Int8): Int8 {
       return (a:Int8) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_b(a: Int8, b: Int): Int8 {
       return a >> (b:Int8);
   }
   @:op(A >>> B) private function urshift(other: Int8): Int8;
   @:op(A >>> B) private inline static function hx_urshift_a(a: Int, b: Int8): Int8 {
       return (a:Int8) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_b(a: Int8, b: Int): Int8 {
       return a >>> (b:Int8);
   }
   @:from public static inline function fromInt(x: Int): Int8 {
       return Convert.int8(x);
   }
   @:to public inline function toFloat(): Float {
       return untyped this;
   }
   @:to public inline function toInt(): Int {
       return untyped this;
   }
}