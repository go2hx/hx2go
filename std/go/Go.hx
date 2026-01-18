package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:go.StaticAccess({ topLevel: true })
extern class Go {
   @:pure public static extern function int(x: Any): GoInt;
   @:pure public static extern function uint(x: Any): GoUInt;
   @:pure public static extern function uint8(x: Any): UInt8;
   @:pure public static extern function uint16(x: Any): UInt16;
   @:pure public static extern function uint32(x: Any): UInt32;
   @:pure public static extern function uint64(x: Any): UInt64;
   @:pure public static extern function int8(x: Any): Int8;
   @:pure public static extern function int16(x: Any): Int16;
   @:pure public static extern function int32(x: Any): Int32;
   @:pure public static extern function int64(x: Any): Int64;
   @:pure public static extern function float32(x: Any): Float32;
   @:pure public static extern function float64(x: Any): Float64;
   public static extern function panic(v: Any): Void;
   @:pure public static extern function len<T>(v: T): GoInt;
   public static extern function append<T>(s: Slice<T>, v: haxe.Rest<T>): Slice<T>;
   public static extern function copy<T>(dst: Slice<T>, src: Slice<T>): GoInt;
   @:pure public static extern function cap<T>(v: Slice<T>): GoInt;
}