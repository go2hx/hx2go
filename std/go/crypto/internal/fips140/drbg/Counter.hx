package go.crypto.internal.fips140.drbg;

@:structInit
@:go.Type({ name: "Counter", instanceName: "drbg.Counter", imports: ["crypto/internal/fips140/drbg"] })
extern class Counter {

    @:native("Generate") function generate(out: go.Slice<go.Byte>, additionalInput: go.Pointer<go.GoArray<go.Byte, 48>>): Bool;
    @:native("Reseed") function reseed(entropy: go.Pointer<go.GoArray<go.Byte, 48>>, additionalInput: go.Pointer<go.GoArray<go.Byte, 48>>): Void;

}