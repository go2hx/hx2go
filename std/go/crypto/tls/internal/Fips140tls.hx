package go.crypto.tls.internal;

@:go.Type({ name: "fips140tls", instanceName: "fips140tls.fips140tls", imports: ["crypto/tls/internal/fips140tls"] })
extern class Fips140tls {

    @:native("Force") static function force(): Void;
    @:native("Required") static function required(): Bool;
    @:native("TestingOnlyAbandon") static function testingOnlyAbandon(): Void;

}