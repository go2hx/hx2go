package go.crypto.internal;

@:go.Type({ name: "entropy", instanceName: "entropy.entropy", imports: ["crypto/internal/entropy"] })
extern class Entropy {

    @:native("Depleted") static function depleted(LOAD: (p0: go.Pointer<go.GoArray<go.Byte, 48>>) -> Void): Void;

}