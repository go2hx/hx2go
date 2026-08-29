package go.crypto.x509;

@:structInit
@:go.Type({ name: "pkcs1PrivateKey", instanceName: "x509.pkcs1PrivateKey", imports: ["crypto/x509"] })
extern class Pkcs1PrivateKey {

    @:native("Version") var version: go.GoInt;
    @:native("N") var N: go.Pointer<go.math.big.Int>;
    @:native("E") var E: go.GoInt;
    @:native("D") var D: go.Pointer<go.math.big.Int>;
    @:native("P") var P: go.Pointer<go.math.big.Int>;
    @:native("Q") var Q: go.Pointer<go.math.big.Int>;
    @:native("Dp") var dp: go.Pointer<go.math.big.Int>;
    @:native("Dq") var dq: go.Pointer<go.math.big.Int>;
    @:native("Qinv") var qinv: go.Pointer<go.math.big.Int>;
    @:native("AdditionalPrimes") var additionalPrimes: go.Slice<go.crypto.x509.Pkcs1AdditionalRSAPrime>;

    function new(version: go.GoInt=0, N: go.Pointer<go.math.big.Int>=null, E: go.GoInt=0, D: go.Pointer<go.math.big.Int>=null, P: go.Pointer<go.math.big.Int>=null, Q: go.Pointer<go.math.big.Int>=null, dp: go.Pointer<go.math.big.Int>=null, dq: go.Pointer<go.math.big.Int>=null, qinv: go.Pointer<go.math.big.Int>=null, additionalPrimes: go.Slice<go.crypto.x509.Pkcs1AdditionalRSAPrime>=null);

}