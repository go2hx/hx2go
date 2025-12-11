package go;

@:coreType @:notNull @:runtimeValue abstract Float32 {
    @:from public static inline function fromFloat64(x: Float64): Float32 {
        return Convert.float32(x);
    }
    @:from public static inline function fromHxFloat(x: Float): Float32 {
        return Convert.float32(x);
    }
    @:from public static inline function fromInt8(x: Int8): Float32 {
        return Convert.float32(x);
    }
    @:from public static inline function fromInt16(x: Int16): Float32 {
        return Convert.float32(x);
    }
    @:from public static inline function fromInt64(x: Int64): Float32 {
        return Convert.float32(x);
    }
    @:from public static inline function fromHxInt(x: Int): Float32 {
        return Convert.float32(x);
    }

    @:op(A + B)
    public function add(other: Float32): Float32;

    @:op(A - B)
    public function sub(other: Float32): Float32;

    @:op(-A)
    public function neg(): Float32;

    @:op(A * B)
    public function mut(other: Float32): Float32;
}
