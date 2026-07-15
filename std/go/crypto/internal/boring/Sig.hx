package go.crypto.internal.boring;

@:go.Type({ name: "sig", instanceName: "sig.sig", imports: ["crypto/internal/boring/sig"] })
extern class Sig {

    @:native("BoringCrypto") static function boringCrypto(): Void;
    @:native("FIPSOnly") static function fIPSOnly(): Void;
    @:native("StandardCrypto") static function standardCrypto(): Void;

}