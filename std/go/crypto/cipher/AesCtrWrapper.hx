package go.crypto.cipher;

@:structInit
@:go.Type({ name: "aesCtrWrapper", instanceName: "cipher.aesCtrWrapper", imports: ["crypto/cipher"] })
extern class AesCtrWrapper {

    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}