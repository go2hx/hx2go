package go.crypto.sha3;

@:structInit
@:go.Type({ name: "SHA3", instanceName: "sha3.SHA3", imports: ["crypto/sha3"] })
extern class SHA3 {

    @:native("AppendBinary") function appendBinary(p: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Clone") function clone(): go.Result<go.hash.Cloner>;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): go.GoInt;
    @:native("Sum") function sum(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): go.Error;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}