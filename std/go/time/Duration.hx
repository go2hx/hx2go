package go.time;

@:coreType
@:notNull
@:runtimeValue
@:go.TypeAccess({ name: "time.Duration", imports: ["time"] })
extern abstract Duration {

    // TODO: this extern is incomplete - https://pkg.go.dev/time

    @:op(A + B) private function add(other: Duration): Duration;
    @:op(A + B) @:commutative private inline function hx_add_a(other: Float): Duration {
        return this + Time.duration(other);
    }
    @:op(A + B) @:commutative private inline function hx_add_b(other: Int): Duration {
        return this + Time.duration(other);
    }
    @:op(A - B) private function sub(other: Duration): Duration;
    @:op(A - B) private inline static function hx_sub_a(a: Float, b: Duration): Duration {
        return Time.duration(a) - b;
    }
    @:op(A - B) private inline static function hx_sub_b(a: Duration, b: Float): Duration {
        return a - Time.duration(b);
    }
    @:op(A - B) private inline static function hx_sub_c(a: Int, b: Duration): Duration {
        return Time.duration(a) - b;
    }
    @:op(A - B) private inline static function hx_sub_d(a: Duration, b: Int): Duration {
        return a - Time.duration(b);
    }
    @:op(A * B) private function mul(other: Duration): Duration;
    @:op(A * B) @:commutative private inline function hx_mul_a(other: Float): Duration {
        return this * Time.duration(other);
    }
    @:op(A * B) @:commutative private inline function hx_mul_b(other: Int): Duration {
        return this * Time.duration(other);
    }
    @:op(A / B) private function div(other: Duration): Duration;
    @:op(A / B) private inline static function hx_div_a(a: Float, b: Duration): Duration {
        return Time.duration(a) / b;
    }
    @:op(A / B) private inline static function hx_div_b(a: Duration, b: Float): Duration {
        return a / Time.duration(b);
    }
    @:op(A / B) private inline static function hx_div_c(a: Int, b: Duration): Duration {
        return Time.duration(a) / b;
    }
    @:op(A / B) private inline static function hx_div_d(a: Duration, b: Int): Duration {
        return a / Time.duration(b);
    }
    @:op(A % B) private function mod(other: Duration): Duration;
    @:op(A % B) private inline static function hx_mod_a(a: Float, b: Duration): Duration {
        return Time.duration(a) % b;
    }
    @:op(A % B) private inline static function hx_mod_b(a: Duration, b: Float): Duration {
        return a % Time.duration(b);
    }
    @:op(A % B) private inline static function hx_mod_c(a: Int, b: Duration): Duration {
        return Time.duration(a) % b;
    }
    @:op(A % B) private inline static function hx_mod_d(a: Duration, b: Int): Duration {
        return a % Time.duration(b);
    }
    @:op(-A) private function neg(): Duration;
    @:op(++A) private function preinc(): Duration;
    @:op(A++) private function postinc(): Duration;
    @:op(--A) private function predec(): Duration;
    @:op(A--) private function postdec(): Duration;
    @:op(A == B) private function eq(other: Duration): Bool;
    @:op(A == B) @:commutative private inline function hx_eq_a(other: Float): Bool {
        return this == Time.duration(other);
    }
    @:op(A == B) @:commutative private inline function hx_eq_b(other: Int): Bool {
        return this == Time.duration(other);
    }
    @:op(A != B) private function neq(other: Duration): Bool;
    @:op(A != B) @:commutative private inline function hx_neq_a(other: Float): Bool {
        return this != Time.duration(other);
    }
    @:op(A != B) @:commutative private inline function hx_neq_b(other: Int): Bool {
        return this != Time.duration(other);
    }
    @:op(A < B) private function lt(other: Duration): Bool;
    @:op(A < B) private inline static function hx_lt_a(a: Float, b: Duration): Bool {
        return Time.duration(a) < b;
    }
    @:op(A < B) private inline static function hx_lt_b(a: Duration, b: Float): Bool {
        return a < Time.duration(b);
    }
    @:op(A < B) private inline static function hx_lt_c(a: Int, b: Duration): Bool {
        return Time.duration(a) < b;
    }
    @:op(A < B) private inline static function hx_lt_d(a: Duration, b: Int): Bool {
        return a < Time.duration(b);
    }
    @:op(A <= B) private function lte(other: Duration): Bool;
    @:op(A <= B) private inline static function hx_lte_a(a: Float, b: Duration): Bool {
        return Time.duration(a) <= b;
    }
    @:op(A <= B) private inline static function hx_lte_b(a: Duration, b: Float): Bool {
        return a <= Time.duration(b);
    }
    @:op(A <= B) private inline static function hx_lte_c(a: Int, b: Duration): Bool {
        return Time.duration(a) <= b;
    }
    @:op(A <= B) private inline static function hx_lte_d(a: Duration, b: Int): Bool {
        return a <= Time.duration(b);
    }
    @:op(A > B) private function gt(other: Duration): Bool;
    @:op(A > B) private inline static function hx_gt_a(a: Float, b: Duration): Bool {
        return Time.duration(a) > b;
    }
    @:op(A > B) private inline static function hx_gt_b(a: Duration, b: Float): Bool {
        return a > Time.duration(b);
    }
    @:op(A > B) private inline static function hx_gt_c(a: Int, b: Duration): Bool {
        return Time.duration(a) > b;
    }
    @:op(A > B) private inline static function hx_gt_d(a: Duration, b: Int): Bool {
        return a > Time.duration(b);
    }
    @:op(A >= B) private function gte(other: Duration): Bool;
    @:op(A >= B) private inline static function hx_gte_a(a: Float, b: Duration): Bool {
        return Time.duration(a) >= b;
    }
    @:op(A >= B) private inline static function hx_gte_b(a: Duration, b: Float): Bool {
        return a >= Time.duration(b);
    }
    @:op(A >= B) private inline static function hx_gte_c(a: Int, b: Duration): Bool {
        return Time.duration(a) >= b;
    }
    @:op(A >= B) private inline static function hx_gte_d(a: Duration, b: Int): Bool {
        return a >= Time.duration(b);
    }
    @:from public static inline function fromInt(x: Int): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromGoInt(x: GoInt): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromGoUInt(x: GoUInt): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromUInt8(x: UInt8): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromUInt16(x: UInt16): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromUInt32(x: UInt32): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromUInt64(x: UInt64): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromInt8(x: Int8): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromInt16(x: Int16): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromInt32(x: Int32): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromInt64(x: Int64): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromFloat(x: Float): Duration {
        return Time.duration(x);
    }
    @:from public static inline function fromFloat32(x: Float32): Duration {
        return Time.duration(x);
    }
    @:to public inline function toFloat(): Float {
        return (untyped this : Float);
    }
}

