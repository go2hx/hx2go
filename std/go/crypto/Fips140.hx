package go.crypto;

@:go.Type({ name: "fips140", instanceName: "fips140.fips140", imports: ["crypto/fips140"] })
extern class Fips140 {

    @:native("Enabled") static function enabled(): (Bool);
    @:native("Enforced") static function enforced(): (Bool);
    @:native("Version") static function version(): (String);
    @:native("WithoutEnforcement") static function withoutEnforcement(f: () -> Void): Void;

}