package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
abstract UInt32 {
   @:op(A + B) private function add(other: UInt32): UInt32;
   @:op(A + B) @:commutative private inline function hx_add(other: Int): UInt32 {
       return this + (other:UInt32);
   }
   @:op(A - B) private function sub(other: UInt32): UInt32;
   @:op(A - B) private inline static function hx_sub_a(a: Int, b: UInt32): UInt32 {
       return (a:UInt32) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: UInt32, b: Int): UInt32 {
       return a - (b:UInt32);
   }
   @:op(A * B) private function mul(other: UInt32): UInt32;
   @:op(A * B) @:commutative private inline function hx_mul(other: Int): UInt32 {
       return this * (other:UInt32);
   }
   @:op(A / B) private inline function div(other: UInt32): Float64 {
       return (this:Float64) / (other:Float64);
   }
   @:op(A / B) private inline static function hx_div_a(a: Int, b: UInt32): Float64 {
       return (a:UInt32) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: UInt32, b: Int): Float64 {
       return a / (b:UInt32);
   }
   @:op(A % B) private function mod(other: UInt32): UInt32;
   @:op(A % B) private inline static function hx_mod_a(a: Int, b: UInt32): UInt32 {
       return (a:UInt32) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: UInt32, b: Int): UInt32 {
       return a % (b:UInt32);
   }
   @:op(-A) private function neg(): UInt32;
   @:op(++A) private function preinc(): UInt32;
   @:op(A++) private function postinc(): UInt32;
   @:op(--A) private function predec(): UInt32;
   @:op(A--) private function postdec(): UInt32;
   @:op(A == B) private function eq(other: UInt32): Bool;
   @:op(A == B) @:commutative private inline function hx_eq(other: Int): Bool {
       return this == (other:UInt32);
   }
   @:op(A != B) private function neq(other: UInt32): Bool;
   @:op(A != B) @:commutative private inline function hx_neq(other: Int): Bool {
       return this != (other:UInt32);
   }
   @:op(A < B) private function lt(other: UInt32): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Int, b: UInt32): Bool {
       return (a:UInt32) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: UInt32, b: Int): Bool {
       return a < (b:UInt32);
   }
   @:op(A <= B) private function lte(other: UInt32): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Int, b: UInt32): Bool {
       return (a:UInt32) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: UInt32, b: Int): Bool {
       return a <= (b:UInt32);
   }
   @:op(A > B) private function gt(other: UInt32): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Int, b: UInt32): Bool {
       return (a:UInt32) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: UInt32, b: Int): Bool {
       return a > (b:UInt32);
   }
   @:op(A >= B) private function gte(other: UInt32): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Int, b: UInt32): Bool {
       return (a:UInt32) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: UInt32, b: Int): Bool {
       return a >= (b:UInt32);
   }
   @:op(A & B) private function and(other: UInt32): UInt32;
   @:op(A & B) @:commutative private inline function hx_and(other: Int): UInt32 {
       return this & (other:UInt32);
   }
   @:op(A | B) private function or(other: UInt32): UInt32;
   @:op(A | B) @:commutative private inline function hx_or(other: Int): UInt32 {
       return this | (other:UInt32);
   }
   @:op(A ^ B) private function xor(other: UInt32): UInt32;
   @:op(A ^ B) @:commutative private inline function hx_xor(other: Int): UInt32 {
       return this ^ (other:UInt32);
   }
   @:op(~A) private function not(): UInt32;
   @:op(A << B) private function lshift(other: UInt32): UInt32;
   @:op(A << B) private inline static function hx_lshift_a(a: Int, b: UInt32): UInt32 {
       return (a:UInt32) << b;
   }
   @:op(A << B) private inline static function hx_lshift_b(a: UInt32, b: Int): UInt32 {
       return a << (b:UInt32);
   }
   @:op(A >> B) private function rshift(other: UInt32): UInt32;
   @:op(A >> B) private inline static function hx_rshift_a(a: Int, b: UInt32): UInt32 {
       return (a:UInt32) >> b;
   }
   @:op(A >> B) private inline static function hx_rshift_b(a: UInt32, b: Int): UInt32 {
       return a >> (b:UInt32);
   }
   @:op(A >>> B) private function urshift(other: UInt32): UInt32;
   @:op(A >>> B) private inline static function hx_urshift_a(a: Int, b: UInt32): UInt32 {
       return (a:UInt32) >>> b;
   }
   @:op(A >>> B) private inline static function hx_urshift_b(a: UInt32, b: Int): UInt32 {
       return a >>> (b:UInt32);
   }
   @:from public static inline function fromInt(x: Int): UInt32 {
       return Go.uint32(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): UInt32 {
       return Go.uint32(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): UInt32 {
       return Go.uint32(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): UInt32 {
       return Go.uint32(x);
   }
   @:from public static inline function fromInt8(x: Int8): UInt32 {
       return Go.uint32(x);
   }
   @:from public static inline function fromInt16(x: Int16): UInt32 {
       return Go.uint32(x);
   }
   @:from public static inline function fromInt64(x: Int64): UInt32 {
       return Go.uint32(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
   @:to public inline function toInt(): Int {
       return (untyped this : Int);
   }
}