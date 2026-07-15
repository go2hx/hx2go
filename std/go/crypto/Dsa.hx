package go.crypto;

@:go.Type({ name: "dsa", instanceName: "dsa.dsa", imports: ["crypto/dsa"] })
extern class Dsa {

    @:native("L1024N160") static var L1024N160: go.crypto.dsa.ParameterSizes;
    @:native("L2048N224") static var L2048N224: go.crypto.dsa.ParameterSizes;
    @:native("L2048N256") static var L2048N256: go.crypto.dsa.ParameterSizes;
    @:native("L3072N256") static var L3072N256: go.crypto.dsa.ParameterSizes;

    @:native("GenerateKey") static function generateKey(priv: go.Pointer<go.crypto.dsa.PrivateKey>, rand: go.io.Reader): go.Error;
    @:native("GenerateParameters") static function generateParameters(params: go.Pointer<go.crypto.dsa.Parameters>, rand: go.io.Reader, sizes: go.crypto.dsa.ParameterSizes): go.Error;
    @:go.Tuple("r", "s", "err") @:native("Sign") static function sign(random: go.io.Reader, priv: go.Pointer<go.crypto.dsa.PrivateKey>, hash: go.Slice<go.Byte>): go.Tuple<{ r: go.Pointer<go.math.big.Int>, s: go.Pointer<go.math.big.Int>, err: go.Error }>;
    @:native("Verify") static function verify(pub: go.Pointer<go.crypto.dsa.PublicKey>, hash: go.Slice<go.Byte>, r: go.Pointer<go.math.big.Int>, s: go.Pointer<go.math.big.Int>): Bool;

}