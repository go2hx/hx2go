package go.hash;

/**
    Hash64 is the common interface implemented by all 64-bit hash functions.
**/
@:go.Type({ name: "Hash64", instanceName: "hash.Hash64", imports: ["hash"] })
extern typedef Hash64 = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Sum64") function sum64(): (go.UInt64);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}