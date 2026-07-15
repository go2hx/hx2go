package go.crypto.internal.fips140.bigmod;

@:structInit
@:go.Type({ name: "Modulus", instanceName: "bigmod.Modulus", imports: ["crypto/internal/fips140/bigmod"] })
extern class Modulus {

    @:native("BitLen") function bitLen(): go.GoInt;
    @:native("Nat") function nat(): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("Size") function size(): go.GoInt;

}