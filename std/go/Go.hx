package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:go.toplevel
extern class Go {
   @:go.native("int")
   @:pure public static function int(x: Any): GoInt;
   @:go.native("uint")
   @:pure public static function uint(x: Any): GoUInt;
   @:go.native("uint8")
   @:pure public static function uint8(x: Any): UInt8;
   @:go.native("uint16")
   @:pure public static function uint16(x: Any): UInt16;
   @:go.native("uint32")
   @:pure public static function uint32(x: Any): UInt32;
   @:go.native("uint64")
   @:pure public static function uint64(x: Any): UInt64;
   @:go.native("int8")
   @:pure public static function int8(x: Any): Int8;
   @:go.native("int16")
   @:pure public static function int16(x: Any): Int16;
   @:go.native("int32")
   @:pure public static function int32(x: Any): Int32;
   @:go.native("int64")
   @:pure public static function int64(x: Any): Int64;
   @:go.native("float32")
   @:pure public static function float32(x: Any): Float32;
   @:go.native("float64")
   @:pure public static function float64(x: Any): Float64;
   @:go.native("panic")
   public static function panic(v: Any): Void;
   @:go.native("len")
   @:pure public static function len<T>(v: T): GoInt;
   @:go.native("append")
   public static function append<T>(s: Slice<T>, v: haxe.Rest<T>): Slice<T>;
   @:go.native("copy")
   public static function copy<T>(dst: Slice<T>, src: Slice<T>): GoInt;
   @:go.native("cap")
   @:pure public static function cap<T>(v: Slice<T>): GoInt;
}