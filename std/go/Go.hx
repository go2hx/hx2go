package go;

// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------
// Please invoke the generator using `./Scripts/GenStdTypes` from the project root
// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------

@:go.Type({ topLevel: true, pascalCase: false })
extern class Go {
   @:pure static function int(x: Dynamic): GoInt;
   @:pure static function uint(x: Dynamic): GoUInt;
   @:pure static function uint8(x: Dynamic): UInt8;
   @:pure static function uint16(x: Dynamic): UInt16;
   @:pure static function uint32(x: Dynamic): UInt32;
   @:pure static function uint64(x: Dynamic): UInt64;
   @:pure static function int8(x: Dynamic): Int8;
   @:pure static function int16(x: Dynamic): Int16;
   @:pure static function int32(x: Dynamic): Int32;
   @:pure static function int64(x: Dynamic): Int64;
   @:pure static function float32(x: Dynamic): Float32;
   @:pure static function float64(x: Dynamic): Float64;
   @:pure static function byte(x: Dynamic): Byte;
   @:pure static function rune(x: Dynamic): Rune;
   @:pure static function complex64(x: Dynamic): Complex64;
   @:pure static function complex128(x: Dynamic): Complex128;
   @:pure @:native("float64") static function float(x: Dynamic): Float;
   static function panic(v: Dynamic): Void;
   @:pure static function len<T>(v: T): GoInt;
   static function append<T>(s: Slice<T>, v: haxe.Rest<T>): Slice<T>;
   static function copy<T>(dst: Slice<T>, src: Slice<T>): GoInt;
   @:pure static function cap<T>(v: Slice<T>): GoInt;
   @:pure static function string(v: Dynamic): String;
}