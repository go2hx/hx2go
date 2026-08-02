package go.crypto.cipher;

@:structInit
@:go.Type({ name: "cfb", instanceName: "cipher.cfb", imports: ["crypto/cipher"] })
extern class Cfb {

    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}