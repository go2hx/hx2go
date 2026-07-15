package go.crypto;

@:go.Type({ name: "ecdh", instanceName: "ecdh.ecdh", imports: ["crypto/ecdh"] })
extern class Ecdh {

    @:native("P256") static function P256(): go.crypto.ecdh.Curve;
    @:native("P384") static function P384(): go.crypto.ecdh.Curve;
    @:native("P521") static function P521(): go.crypto.ecdh.Curve;
    @:native("X25519") static function X25519(): go.crypto.ecdh.Curve;

}