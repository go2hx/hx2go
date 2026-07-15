package go.hash;

@:go.Type({ name: "maphash", instanceName: "maphash.maphash", imports: ["hash/maphash"] })
extern class Maphash {

    @:native("Bytes") static function bytes(seed: go.hash.maphash.Seed, b: go.Slice<go.Byte>): go.UInt64;
    @:native("Comparable") static function comparable<T: go.Comparable>(seed: go.hash.maphash.Seed, v: T): go.UInt64;
    @:native("MakeSeed") static function makeSeed(): go.hash.maphash.Seed;
    @:native("String") static function string(seed: go.hash.maphash.Seed, s: String): go.UInt64;
    @:native("WriteComparable") static function writeComparable<T: go.Comparable>(h: go.Pointer<go.hash.maphash.Hash>, x: T): Void;

}