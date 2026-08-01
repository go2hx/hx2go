package go.crypto.cipher;

@:go.Type({ name: "Stream", instanceName: "cipher.Stream", imports: ["crypto/cipher"] })
extern typedef Stream = {

    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}