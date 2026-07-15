package go.crypto.internal.fips140;

@:go.Type({ name: "hmac", instanceName: "hmac.hmac", imports: ["crypto/internal/fips140/hmac"] })
extern class Hmac {

    @:native("MarkAsUsedInKDF") static function markAsUsedInKDF(h: go.Pointer<go.crypto.internal.fips140.hmac.HMAC>): Void;
    @:native("New") static function _new<H: go.hash.Hash>(h: () -> H, key: go.Slice<go.Byte>): go.Pointer<go.crypto.internal.fips140.hmac.HMAC>;

}