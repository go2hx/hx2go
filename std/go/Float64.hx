package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:coreType
@:notNull
@:runtimeValue
extern abstract Float64 {
   @:op(A + B) private function add(other: Float64): Float64;
   @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Float64 {
       return this + Go.float64(other);
   }
   @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Float64 {
       return this + Go.float64(other);
   }
   @:op(A - B) private function sub(other: Float64): Float64;
   @:op(A - B) private inline static function hx_sub_a(a: Float, b: Float64): Float64 {
       return Go.float64(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_b(a: Float64, b: Float): Float64 {
       return a - Go.float64(b);
   }
   @:op(A - B) private inline static function hx_sub_c(a: Int, b: Float64): Float64 {
       return Go.float64(a) - b;
   }
   @:op(A - B) private inline static function hx_sub_d(a: Float64, b: Int): Float64 {
       return a - Go.float64(b);
   }
   @:op(A * B) private function mul(other: Float64): Float64;
   @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Float64 {
       return this * Go.float64(other);
   }
   @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Float64 {
       return this * Go.float64(other);
   }
   @:op(A / B) private function div(other: Float64): Float64;
   @:op(A / B) private inline static function hx_div_a(a: Float, b: Float64): Float64 {
       return Go.float64(a) / b;
   }
   @:op(A / B) private inline static function hx_div_b(a: Float64, b: Float): Float64 {
       return a / Go.float64(b);
   }
   @:op(A / B) private inline static function hx_div_c(a: Int, b: Float64): Float64 {
       return Go.float64(a) / b;
   }
   @:op(A / B) private inline static function hx_div_d(a: Float64, b: Int): Float64 {
       return a / Go.float64(b);
   }
   @:op(A % B) private function mod(other: Float64): Float64;
   @:op(A % B) private inline static function hx_mod_a(a: Float, b: Float64): Float64 {
       return Go.float64(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_b(a: Float64, b: Float): Float64 {
       return a % Go.float64(b);
   }
   @:op(A % B) private inline static function hx_mod_c(a: Int, b: Float64): Float64 {
       return Go.float64(a) % b;
   }
   @:op(A % B) private inline static function hx_mod_d(a: Float64, b: Int): Float64 {
       return a % Go.float64(b);
   }
   @:op(-A) private function neg(): Float64;
   @:op(++A) private function preinc(): Float64;
   @:op(A++) private function postinc(): Float64;
   @:op(--A) private function predec(): Float64;
   @:op(A--) private function postdec(): Float64;
   @:op(A == B) private function eq(other: Float64): Bool;
   @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
       return this == Go.float64(other);
   }
   @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
       return this == Go.float64(other);
   }
   @:op(A != B) private function neq(other: Float64): Bool;
   @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
       return this != Go.float64(other);
   }
   @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
       return this != Go.float64(other);
   }
   @:op(A < B) private function lt(other: Float64): Bool;
   @:op(A < B) private inline static function hx_lt_a(a: Float, b: Float64): Bool {
       return Go.float64(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_b(a: Float64, b: Float): Bool {
       return a < Go.float64(b);
   }
   @:op(A < B) private inline static function hx_lt_c(a: Int, b: Float64): Bool {
       return Go.float64(a) < b;
   }
   @:op(A < B) private inline static function hx_lt_d(a: Float64, b: Int): Bool {
       return a < Go.float64(b);
   }
   @:op(A <= B) private function lte(other: Float64): Bool;
   @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Float64): Bool {
       return Go.float64(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_b(a: Float64, b: Float): Bool {
       return a <= Go.float64(b);
   }
   @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Float64): Bool {
       return Go.float64(a) <= b;
   }
   @:op(A <= B) private inline static function hx_lte_d(a: Float64, b: Int): Bool {
       return a <= Go.float64(b);
   }
   @:op(A > B) private function gt(other: Float64): Bool;
   @:op(A > B) private inline static function hx_gt_a(a: Float, b: Float64): Bool {
       return Go.float64(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_b(a: Float64, b: Float): Bool {
       return a > Go.float64(b);
   }
   @:op(A > B) private inline static function hx_gt_c(a: Int, b: Float64): Bool {
       return Go.float64(a) > b;
   }
   @:op(A > B) private inline static function hx_gt_d(a: Float64, b: Int): Bool {
       return a > Go.float64(b);
   }
   @:op(A >= B) private function gte(other: Float64): Bool;
   @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Float64): Bool {
       return Go.float64(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_b(a: Float64, b: Float): Bool {
       return a >= Go.float64(b);
   }
   @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Float64): Bool {
       return Go.float64(a) >= b;
   }
   @:op(A >= B) private inline static function hx_gte_d(a: Float64, b: Int): Bool {
       return a >= Go.float64(b);
   }
   @:from public static inline function fromInt(x: Int): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromGoInt(x: GoInt): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromGoUInt(x: GoUInt): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromUInt8(x: UInt8): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromUInt16(x: UInt16): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromUInt32(x: UInt32): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromUInt64(x: UInt64): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromInt8(x: Int8): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromInt16(x: Int16): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromInt32(x: Int32): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromInt64(x: Int64): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromFloat(x: Float): Float64 {
       return Go.float64(x);
   }
   @:from public static inline function fromFloat32(x: Float32): Float64 {
       return Go.float64(x);
   }
   @:to public inline function toFloat(): Float {
       return (untyped this : Float);
   }
}