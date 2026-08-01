package go.crypto.tls;

@:structInit
@:go.Type({ name: "cthWrapper", instanceName: "tls.cthWrapper", imports: ["crypto/tls"] })
extern class CthWrapper {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}