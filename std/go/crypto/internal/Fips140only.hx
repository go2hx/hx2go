package go.crypto.internal;

@:go.Type({ name: "fips140only", instanceName: "fips140only.fips140only", imports: ["crypto/internal/fips140only"] })
extern class Fips140only {

    @:native("ApprovedHash") static function approvedHash(h: go.hash.Hash): Bool;
    @:native("ApprovedRandomReader") static function approvedRandomReader(r: go.io.Reader): Bool;
    @:native("Enforced") static function enforced(): Bool;

}