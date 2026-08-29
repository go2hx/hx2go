package go.crypto.sha3;

/**
    SHAKE is an instance of a SHAKE extendable output function.
    The zero value is a usable SHAKE256 hash.
**/
@:structInit
@:go.Type({ name: "SHAKE", instanceName: "sha3.SHAKE", imports: ["crypto/sha3"] })
extern class SHAKE {

    /**
        AppendBinary implements [encoding.BinaryAppender].
    **/
    @:native("AppendBinary") function appendBinary(p: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        BlockSize returns the rate of the XOF.
    **/
    @:native("BlockSize") function blockSize(): (go.GoInt);
    /**
        MarshalBinary implements [encoding.BinaryMarshaler].
    **/
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    /**
        Read squeezes more output from the XOF.
        
        Any call to Write after a call to Read will panic.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        Reset resets the XOF to its initial state.
    **/
    @:native("Reset") function reset(): Void;
    /**
        UnmarshalBinary implements [encoding.BinaryUnmarshaler].
    **/
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): (go.Error);
    /**
        Write absorbs more data into the XOF's state.
        
        It panics if any output has already been read.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}