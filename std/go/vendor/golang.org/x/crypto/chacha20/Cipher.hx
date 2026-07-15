package go.vendor.golang.org.x.crypto.chacha20;

@:structInit
@:go.Type({ name: "Cipher", instanceName: "chacha20.Cipher", imports: ["vendor/golang.org/x/crypto/chacha20"] })
extern class Cipher {

    @:native("SetCounter") function setCounter(counter: go.UInt32): Void;
    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}