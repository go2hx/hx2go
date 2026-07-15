package go.crypto.mlkem;

@:go.Type({ name: "mlkemtest", instanceName: "mlkemtest.mlkemtest", imports: ["crypto/mlkem/mlkemtest"] })
extern class Mlkemtest {

    @:go.Tuple("sharedKey", "ciphertext", "err") @:native("Encapsulate1024") static function encapsulate1024(ek: go.Pointer<go.crypto.mlkem.EncapsulationKey1024>, random: go.Slice<go.Byte>): go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, err: go.Error }>;
    @:go.Tuple("sharedKey", "ciphertext", "err") @:native("Encapsulate768") static function encapsulate768(ek: go.Pointer<go.crypto.mlkem.EncapsulationKey768>, random: go.Slice<go.Byte>): go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, err: go.Error }>;

}