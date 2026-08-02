package go.archive.zip;

@:structInit
@:go.Type({ name: "pooledFlateReader", instanceName: "zip.pooledFlateReader", imports: ["archive/zip"] })
extern class PooledFlateReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}