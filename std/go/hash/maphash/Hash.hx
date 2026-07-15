package go.hash.maphash;

@:structInit
@:go.Type({ name: "Hash", instanceName: "maphash.Hash", imports: ["hash/maphash"] })
extern class Hash {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Clone") function clone(): go.Result<go.hash.Cloner>;
    @:native("Reset") function reset(): Void;
    @:native("Seed") function seed(): go.hash.maphash.Seed;
    @:native("SetSeed") function setSeed(seed: go.hash.maphash.Seed): Void;
    @:native("Size") function size(): go.GoInt;
    @:native("Sum") function sum(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Sum64") function sum64(): go.UInt64;
    @:native("Write") function write(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteByte") function writeByte(b: go.Byte): go.Error;
    @:native("WriteString") function writeString(s: String): go.Result<go.GoInt>;

}