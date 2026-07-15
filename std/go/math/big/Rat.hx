package go.math.big;

@:structInit
@:go.Type({ name: "Rat", instanceName: "big.Rat", imports: ["math/big"] })
extern class Rat {

    @:native("Abs") function abs(x: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("Add") function add(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Cmp") function cmp(y: go.Pointer<go.math.big.Rat>): go.GoInt;
    @:native("Denom") function denom(): go.Pointer<go.math.big.Int>;
    @:go.Tuple("f", "exact") @:native("Float32") function float32(): go.Tuple<{ f: go.Float32, exact: Bool }>;
    @:go.Tuple("f", "exact") @:native("Float64") function float64(): go.Tuple<{ f: Float, exact: Bool }>;
    @:go.Tuple("n", "exact") @:native("FloatPrec") function floatPrec(): go.Tuple<{ n: go.GoInt, exact: Bool }>;
    @:native("FloatString") function floatString(prec: go.GoInt): String;
    @:native("GobDecode") function gobDecode(buf: go.Slice<go.Byte>): go.Error;
    @:native("GobEncode") function gobEncode(): go.Result<go.Slice<go.Byte>>;
    @:native("Inv") function inv(x: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("IsInt") function isInt(): Bool;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("Mul") function mul(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("Neg") function neg(x: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("Num") function num(): go.Pointer<go.math.big.Int>;
    @:native("Quo") function quo(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("RatString") function ratString(): String;
    @:native("Scan") function scan(s: go.fmt.ScanState, ch: go.Rune): go.Error;
    @:native("Set") function set(x: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("SetFloat64") function setFloat64(f: Float): go.Pointer<go.math.big.Rat>;
    @:native("SetFrac") function setFrac(a: go.Pointer<go.math.big.Int>, b: go.Pointer<go.math.big.Int>): go.Pointer<go.math.big.Rat>;
    @:native("SetFrac64") function setFrac64(a: go.Int64, b: go.Int64): go.Pointer<go.math.big.Rat>;
    @:native("SetInt") function setInt(x: go.Pointer<go.math.big.Int>): go.Pointer<go.math.big.Rat>;
    @:native("SetInt64") function setInt64(x: go.Int64): go.Pointer<go.math.big.Rat>;
    @:go.Tuple("p0", "p1") @:native("SetString") function setString(s: String): go.Tuple<{ p0: go.Pointer<go.math.big.Rat>, p1: Bool }>;
    @:native("SetUint64") function setUint64(x: go.UInt64): go.Pointer<go.math.big.Rat>;
    @:native("Sign") function sign(): go.GoInt;
    @:native("String") function string(): String;
    @:native("Sub") function sub(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Rat>;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;

}