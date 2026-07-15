package go.crypto.internal.fips140.sha3;

@:structInit
@:go.Type({ name: "Digest", instanceName: "sha3.Digest", imports: ["crypto/internal/fips140/sha3"] })
extern class Digest {

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Clone") function clone(): go.Pointer<go.crypto.internal.fips140.sha3.Digest>;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): go.GoInt;
    @:native("Sum") function sum(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): go.Error;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}