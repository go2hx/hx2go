package go.hash;

@:go.Type({ name: "Hash32", instanceName: "hash.Hash32", imports: ["hash"] })
extern typedef Hash32 = {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): go.GoInt;
    @:native("Sum") function sum(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Sum32") function sum32(): go.UInt32;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}