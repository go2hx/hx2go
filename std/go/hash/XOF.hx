package go.hash;

@:go.Type({ name: "XOF", instanceName: "hash.XOF", imports: ["hash"] })
extern typedef XOF = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Reset") function reset(): Void;
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}