package go.crypto.tls;

@:go.Type({ name: "constantTimeHash", instanceName: "tls.constantTimeHash", imports: ["crypto/tls"] })
extern typedef ConstantTimeHash = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("ConstantTimeSum") function constantTimeSum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}