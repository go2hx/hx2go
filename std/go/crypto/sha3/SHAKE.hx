package go.crypto.sha3;

@:structInit
@:go.Type({ name: "SHAKE", instanceName: "sha3.SHAKE", imports: ["crypto/sha3"] })
extern class SHAKE {

    @:native("AppendBinary") function appendBinary(p: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Reset") function reset(): Void;
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): go.Error;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}