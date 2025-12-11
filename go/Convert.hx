package go;

@:go.toplevel
extern class Convert {
    @:go.native("int8")
    public static extern function int8(x: Any): Int8;

    @:go.native("int16")
    public static extern function int16(x: Any): Int16;

    @:go.native("int32")
    public static extern function int32(x: Any): Int32;

    @:go.native("int64")
    public static extern function int64(x: Any): Int64;

    @:go.native("float32")
    public static extern function float32(x: Any): Float32;

    @:go.native("float64")
    public static extern function float64(x: Any): Float64;
}
