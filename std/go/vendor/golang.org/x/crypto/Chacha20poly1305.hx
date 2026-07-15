package go.vendor.golang.org.x.crypto;

@:go.Type({ name: "chacha20poly1305", instanceName: "chacha20poly1305.chacha20poly1305", imports: ["vendor/golang.org/x/crypto/chacha20poly1305"] })
extern class Chacha20poly1305 {

    @:native("KeySize") static var KeySize: go.GoInt;
    @:native("NonceSize") static var NonceSize: go.GoInt;
    @:native("NonceSizeX") static var NonceSizeX: go.GoInt;
    @:native("Overhead") static var Overhead: go.GoInt;

    @:native("New") static function _new(key: go.Slice<go.Byte>): go.Result<go.crypto.cipher.AEAD>;
    @:native("NewX") static function newX(key: go.Slice<go.Byte>): go.Result<go.crypto.cipher.AEAD>;

}