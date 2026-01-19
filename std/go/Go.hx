package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:go.TypeAccess({ topLevel: true, transformName: false })
extern class Go {
   @:pure static function int(x: Any): GoInt;
   @:pure static function uint(x: Any): GoUInt;
   @:pure static function uint8(x: Any): UInt8;
   @:pure static function uint16(x: Any): UInt16;
   @:pure static function uint32(x: Any): UInt32;
   @:pure static function uint64(x: Any): UInt64;
   @:pure static function int8(x: Any): Int8;
   @:pure static function int16(x: Any): Int16;
   @:pure static function int32(x: Any): Int32;
   @:pure static function int64(x: Any): Int64;
   @:pure static function float32(x: Any): Float32;
   @:pure static function float64(x: Any): Float64;
   static function panic(v: Any): Void;
   @:pure static function len<T>(v: T): GoInt;
   static function append<T>(s: Slice<T>, v: haxe.Rest<T>): Slice<T>;
   static function copy<T>(dst: Slice<T>, src: Slice<T>): GoInt;
   @:pure static function cap<T>(v: Slice<T>): GoInt;
}