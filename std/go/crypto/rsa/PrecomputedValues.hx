package go.crypto.rsa;

@:structInit
@:go.Type({ name: "PrecomputedValues", instanceName: "rsa.PrecomputedValues", imports: ["crypto/rsa"] })
extern class PrecomputedValues {

    @:native("Dp") var dp: go.Pointer<go.math.big.Int>;
    @:native("Dq") var dq: go.Pointer<go.math.big.Int>;
    @:native("Qinv") var qinv: go.Pointer<go.math.big.Int>;
    @:native("CRTValues") var cRTValues: go.Slice<go.crypto.rsa.CRTValue>;

function new(dp: go.Pointer<go.math.big.Int>, dq: go.Pointer<go.math.big.Int>, qinv: go.Pointer<go.math.big.Int>, cRTValues: go.Slice<go.crypto.rsa.CRTValue>);

}