package go.archive.zip;

@:structInit
@:go.Type({ name: "pooledFlateWriter", instanceName: "zip.pooledFlateWriter", imports: ["archive/zip"] })
extern class PooledFlateWriter {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}