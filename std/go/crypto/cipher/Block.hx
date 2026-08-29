package go.crypto.cipher;

/**
    A Block represents an implementation of block cipher
    using a given key. It provides the capability to encrypt
    or decrypt individual blocks. The mode implementations
    extend that capability to streams of blocks.
**/
@:go.Type({ name: "Block", instanceName: "cipher.Block", imports: ["crypto/cipher"] })
extern typedef Block = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Decrypt") function decrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("Encrypt") function encrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}