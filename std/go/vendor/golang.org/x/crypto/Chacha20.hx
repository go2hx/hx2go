package go.vendor.golang.org.x.crypto;

@:go.Type({ name: "chacha20", instanceName: "chacha20.chacha20", imports: ["vendor/golang.org/x/crypto/chacha20"] })
extern class Chacha20 {

    @:native("KeySize") static var KeySize: go.GoInt;
    @:native("NonceSize") static var NonceSize: go.GoInt;
    @:native("NonceSizeX") static var NonceSizeX: go.GoInt;

    @:native("HChaCha20") static function hChaCha20(key: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("NewUnauthenticatedCipher") static function newUnauthenticatedCipher(key: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>): go.Result<go.Pointer<go.vendor.golang.org.x.crypto.chacha20.Cipher>>;

}