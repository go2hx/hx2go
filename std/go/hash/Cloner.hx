package go.hash;

@:go.Type({ name: "Cloner", instanceName: "hash.Cloner", imports: ["hash"] })
extern typedef Cloner = {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Clone") function clone(): go.Result<go.hash.Cloner>;
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): go.GoInt;
    @:native("Sum") function sum(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}