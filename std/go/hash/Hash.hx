package go.hash;

@:go.Type({ name: "Hash", instanceName: "hash.Hash", imports: ["hash"] })
extern typedef Hash = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}