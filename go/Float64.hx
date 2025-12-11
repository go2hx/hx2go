package go;

@:coreType @:notNull @:runtimeValue abstract Float64 {
    @:from public static inline function fromFloat32(x: Float32): Float64 {
        return Convert.float64(x);
    }
    @:from public static inline function fromHxFloat(x: Float): Float64 {
        return Convert.float64(x);
    }
    @:from public static inline function fromInt8(x: Int8): Float64 {
        return Convert.float64(x);
    }
    @:from public static inline function fromInt16(x: Int16): Float64 {
        return Convert.float64(x);
    }
    @:from public static inline function fromInt64(x: Int64): Float64 {
        return Convert.float64(x);
    }
    @:from public static inline function fromHxInt(x: Int): Float64 {
        return Convert.float64(x);
    }
}
