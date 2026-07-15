package go.crypto.internal;

@:go.Type({ name: "fips140", instanceName: "fips140.fips140", imports: ["crypto/internal/fips140"] })
extern class Fips140 {

    @:native("Enabled") static var Enabled: Bool;

    @:native("CAST") static function CAST(name: String, f: () -> go.Error): Void;
    @:native("Name") static function name(): String;
    @:native("PCT") static function PCT(name: String, f: () -> go.Error): Void;
    @:native("RecordApproved") static function recordApproved(): Void;
    @:native("RecordNonApproved") static function recordNonApproved(): Void;
    @:native("ResetServiceIndicator") static function resetServiceIndicator(): Void;
    @:native("ServiceIndicator") static function serviceIndicator(): Bool;
    @:native("Supported") static function supported(): go.Error;
    @:native("Version") static function version(): String;

}