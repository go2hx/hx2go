package go.crypto;

@:go.Type({ name: "hmac", instanceName: "hmac.hmac", imports: ["crypto/hmac"] })
extern class Hmac {

    @:native("Equal") static function equal(mac1: go.Slice<go.Byte>, mac2: go.Slice<go.Byte>): Bool;
    @:native("New") static function _new(h: () -> go.hash.Hash, key: go.Slice<go.Byte>): go.hash.Hash;

}