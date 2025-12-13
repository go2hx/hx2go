package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:go.toplevel
extern class Go {
   @:go.native("int")
   @:pure public static extern function int(x: Any): GoInt;
   @:go.native("uint")
   @:pure public static extern function uint(x: Any): GoUInt;
   @:go.native("uint8")
   @:pure public static extern function uint8(x: Any): UInt8;
   @:go.native("uint16")
   @:pure public static extern function uint16(x: Any): UInt16;
   @:go.native("uint32")
   @:pure public static extern function uint32(x: Any): UInt32;
   @:go.native("uint64")
   @:pure public static extern function uint64(x: Any): UInt64;
   @:go.native("int8")
   @:pure public static extern function int8(x: Any): Int8;
   @:go.native("int16")
   @:pure public static extern function int16(x: Any): Int16;
   @:go.native("int32")
   @:pure public static extern function int32(x: Any): Int32;
   @:go.native("int64")
   @:pure public static extern function int64(x: Any): Int64;
   @:go.native("float32")
   @:pure public static extern function float32(x: Any): Float32;
   @:go.native("float64")
   @:pure public static extern function float64(x: Any): Float64;
   @:go.native("panic")
   public static extern function panic(v: Any): Void;
   @:go.native("len")
   public static extern function len<T>(v: T): GoInt;
   @:go.native("append")
   public static extern function append<T>(s: Slice<T>, v: haxe.Rest<T>): Slice<T>;
   @:go.native("copy")
   public static extern function copy<T>(dst: Slice<T>, src: Slice<T>): GoInt;
   @:go.native("cap")
   public static extern function cap<T>(v: Slice<T>): GoInt;
}