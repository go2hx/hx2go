package go.crypto.cipher;

@:structInit
@:go.Type({ name: "ofb", instanceName: "cipher.ofb", imports: ["crypto/cipher"] })
extern class Ofb {

    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}