package go.crypto.rc4;

@:structInit
@:go.Type({ name: "Cipher", instanceName: "rc4.Cipher", imports: ["crypto/rc4"] })
extern class Cipher {

    @:native("Reset") function reset(): Void;
    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}