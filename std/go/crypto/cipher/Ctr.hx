package go.crypto.cipher;

@:structInit
@:go.Type({ name: "ctr", instanceName: "cipher.ctr", imports: ["crypto/cipher"] })
extern class Ctr {

    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}