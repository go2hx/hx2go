package go.crypto.sha3;

/**
    SHA3 is an instance of a SHA-3 hash. It implements [hash.Hash].
    The zero value is a usable SHA3-256 hash.
**/
@:structInit
@:go.Type({ name: "SHA3", instanceName: "sha3.SHA3", imports: ["crypto/sha3"] })
extern class SHA3 {

    /**
        AppendBinary implements [encoding.BinaryAppender].
    **/
    @:native("AppendBinary") function appendBinary(p: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        BlockSize returns the hash's rate.
    **/
    @:native("BlockSize") function blockSize(): (go.GoInt);
    /**
        Clone implements [hash.Cloner].
    **/
    @:native("Clone") function clone(): (go.Result<go.hash.Cloner>);
    /**
        MarshalBinary implements [encoding.BinaryMarshaler].
    **/
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    /**
        Reset resets the hash to its initial state.
    **/
    @:native("Reset") function reset(): Void;
    /**
        Size returns the number of bytes Sum will produce.
    **/
    @:native("Size") function size(): (go.GoInt);
    /**
        Sum appends the current hash to b and returns the resulting slice.
    **/
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        UnmarshalBinary implements [encoding.BinaryUnmarshaler].
    **/
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): (go.Error);
    /**
        Write absorbs more data into the hash's state.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}