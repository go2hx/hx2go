package go.crypto.internal.fips140.hmac;

@:structInit
@:go.Type({ name: "HMAC", instanceName: "hmac.HMAC", imports: ["crypto/internal/fips140/hmac"] })
extern class HMAC {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Clone") function clone(): go.Result<go.hash.Cloner>;
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): go.GoInt;
    @:native("Sum") function sum(_in: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}