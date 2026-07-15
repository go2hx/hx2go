package go.crypto.internal.fips140;

@:go.Type({ name: "check", instanceName: "check.check", imports: ["crypto/internal/fips140/check"] })
extern class Check {

    @:native("Linkinfo") static var Linkinfo: go.struct{Magic [16]byte; Sum [32]byte; Self uintptr; Sects [4]struct{Start unsafe.Pointer; End unsafe.Pointer}};
    @:native("Verified") static var Verified: Bool;

}