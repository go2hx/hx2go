package go.math.big;

@:structInit
@:go.Type({ name: "Float", instanceName: "big.Float", imports: ["math/big"] })
extern class Float {

    @:native("Abs") function abs(x: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:native("Acc") function acc(): go.math.big.Accuracy;
    @:native("Add") function add(x: go.Pointer<go.math.big.Float>, y: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:native("Append") function append(buf: go.Slice<go.Byte>, fmt: go.Byte, prec: go.GoInt): go.Slice<go.Byte>;
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Cmp") function cmp(y: go.Pointer<go.math.big.Float>): go.GoInt;
    @:native("Copy") function copy(x: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:go.Tuple("p0", "p1") @:native("Float32") function float32(): go.Tuple<{ p0: go.Float32, p1: go.math.big.Accuracy }>;
    @:go.Tuple("p0", "p1") @:native("Float64") function float64(): go.Tuple<{ p0: Float, p1: go.math.big.Accuracy }>;
    @:native("Format") function format(s: go.fmt.State, format: go.Rune): Void;
    @:native("GobDecode") function gobDecode(buf: go.Slice<go.Byte>): go.Error;
    @:native("GobEncode") function gobEncode(): go.Result<go.Slice<go.Byte>>;
    @:go.Tuple("p0", "p1") @:native("Int") function int(z: go.Pointer<go.math.big.Int>): go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.math.big.Accuracy }>;
    @:go.Tuple("p0", "p1") @:native("Int64") function int64(): go.Tuple<{ p0: go.Int64, p1: go.math.big.Accuracy }>;
    @:native("IsInf") function isInf(): Bool;
    @:native("IsInt") function isInt(): Bool;
    @:native("MantExp") function mantExp(mant: go.Pointer<go.math.big.Float>): go.GoInt;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("MinPrec") function minPrec(): go.GoUInt;
    @:native("Mode") function mode(): go.math.big.RoundingMode;
    @:native("Mul") function mul(x: go.Pointer<go.math.big.Float>, y: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:native("Neg") function neg(x: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:go.Tuple("f", "b", "err") @:native("Parse") function parse(s: String, base: go.GoInt): go.Tuple<{ f: go.Pointer<go.math.big.Float>, b: go.GoInt, err: go.Error }>;
    @:native("Prec") function prec(): go.GoUInt;
    @:native("Quo") function quo(x: go.Pointer<go.math.big.Float>, y: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:go.Tuple("p0", "p1") @:native("Rat") function rat(z: go.Pointer<go.math.big.Rat>): go.Tuple<{ p0: go.Pointer<go.math.big.Rat>, p1: go.math.big.Accuracy }>;
    @:native("Scan") function scan(s: go.fmt.ScanState, ch: go.Rune): go.Error;
    @:native("Set") function set(x: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:native("SetFloat64") function setFloat64(x: Float): go.Pointer<go.math.big.Float>;
    @:native("SetInf") function setInf(signbit: Bool): go.Pointer<go.math.big.Float>;
    @:native("SetInt") function setInt(x: go.Pointer<go.math.big.Int>): go.Pointer<go.math.big.Float>;
    @:native("SetInt64") function setInt64(x: go.Int64): go.Pointer<go.math.big.Float>;
    @:native("SetMantExp") function setMantExp(mant: go.Pointer<go.math.big.Float>, exp: go.GoInt): go.Pointer<go.math.big.Float>;
    @:native("SetMode") function setMode(mode: go.math.big.RoundingMode): go.Pointer<go.math.big.Float>;
    @:native("SetPrec") function setPrec(prec: go.GoUInt): go.Pointer<go.math.big.Float>;
    @:native("SetRat") function setRat(x: go.Pointer<go.math.big.Rat>): go.Pointer<go.math.big.Float>;
    @:go.Tuple("p0", "p1") @:native("SetString") function setString(s: String): go.Tuple<{ p0: go.Pointer<go.math.big.Float>, p1: Bool }>;
    @:native("SetUint64") function setUint64(x: go.UInt64): go.Pointer<go.math.big.Float>;
    @:native("Sign") function sign(): go.GoInt;
    @:native("Signbit") function signbit(): Bool;
    @:native("Sqrt") function sqrt(x: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:native("String") function string(): String;
    @:native("Sub") function sub(x: go.Pointer<go.math.big.Float>, y: go.Pointer<go.math.big.Float>): go.Pointer<go.math.big.Float>;
    @:native("Text") function text(format: go.Byte, prec: go.GoInt): String;
    @:go.Tuple("p0", "p1") @:native("Uint64") function uint64(): go.Tuple<{ p0: go.UInt64, p1: go.math.big.Accuracy }>;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;

}