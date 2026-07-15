package go.crypto.internal.fips140deps;

@:go.Type({ name: "time", instanceName: "time.time", imports: ["crypto/internal/fips140deps/time"] })
extern class Time {

    @:native("HighPrecisionNow") static function highPrecisionNow(): go.Int64;

}