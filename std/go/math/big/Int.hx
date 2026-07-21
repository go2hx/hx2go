package go.math.big;

@:structInit
@:go.Type({ name: "Int", instanceName: "big.Int", imports: ["math/big"] })
extern class Int {

    @:native("Abs") function abs(x: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Add") function add(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("And") function and(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("AndNot") function andNot(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Append") function append(buf: go.Slice<go.Byte>, base: go.GoInt): (go.Slice<go.Byte>);
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Binomial") function binomial(n: go.Int64, k: go.Int64): (go.Pointer<go.math.big.Int>);
    @:native("Bit") function bit(i: go.GoInt): (go.GoUInt);
    @:native("BitLen") function bitLen(): (go.GoInt);
    @:native("Bits") function bits(): (go.Slice<go.math.big.Word>);
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Cmp") function cmp(y: go.Pointer<go.math.big.Int>): (go.GoInt);
    @:native("CmpAbs") function cmpAbs(y: go.Pointer<go.math.big.Int>): (go.GoInt);
    @:native("Div") function div(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:go.Tuple("p0", "p1") @:native("DivMod") function divMod(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>, m: go.Pointer<go.math.big.Int>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:native("Exp") function exp(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>, m: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("FillBytes") function fillBytes(buf: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:go.Tuple("p0", "p1") @:native("Float64") function float64(): (go.Tuple<{ p0: Float, p1: go.math.big.Accuracy }>);
    @:native("Format") function format(s: go.fmt.State, ch: go.Rune): Void;
    @:native("GCD") function GCD(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>, a: go.Pointer<go.math.big.Int>, b: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("GobDecode") function gobDecode(buf: go.Slice<go.Byte>): (go.Error);
    @:native("GobEncode") function gobEncode(): (go.Result<go.Slice<go.Byte>>);
    @:native("Int64") function int64(): (go.Int64);
    @:native("IsInt64") function isInt64(): (Bool);
    @:native("IsUint64") function isUint64(): (Bool);
    @:native("Lsh") function lsh(x: go.Pointer<go.math.big.Int>, n: go.GoUInt): (go.Pointer<go.math.big.Int>);
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    @:native("Mod") function mod(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("ModInverse") function modInverse(g: go.Pointer<go.math.big.Int>, n: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("ModSqrt") function modSqrt(x: go.Pointer<go.math.big.Int>, p: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Mul") function mul(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("MulRange") function mulRange(a: go.Int64, b: go.Int64): (go.Pointer<go.math.big.Int>);
    @:native("Neg") function neg(x: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Not") function not(x: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Or") function or(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("ProbablyPrime") function probablyPrime(n: go.GoInt): (Bool);
    @:native("Quo") function quo(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:go.Tuple("p0", "p1") @:native("QuoRem") function quoRem(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>, r: go.Pointer<go.math.big.Int>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:native("Rand") function rand(rnd: go.Pointer<go.math.rand.Rand>, n: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Rem") function rem(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Rsh") function rsh(x: go.Pointer<go.math.big.Int>, n: go.GoUInt): (go.Pointer<go.math.big.Int>);
    @:native("Scan") function scan(s: go.fmt.ScanState, ch: go.Rune): (go.Error);
    @:native("Set") function set(x: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("SetBit") function setBit(x: go.Pointer<go.math.big.Int>, i: go.GoInt, b: go.GoUInt): (go.Pointer<go.math.big.Int>);
    @:native("SetBits") function setBits(abs: go.Slice<go.math.big.Word>): (go.Pointer<go.math.big.Int>);
    @:native("SetBytes") function setBytes(buf: go.Slice<go.Byte>): (go.Pointer<go.math.big.Int>);
    @:native("SetInt64") function setInt64(x: go.Int64): (go.Pointer<go.math.big.Int>);
    @:go.Tuple("p0", "p1") @:native("SetString") function setString(s: String, base: go.GoInt): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: Bool }>);
    @:native("SetUint64") function setUint64(x: go.UInt64): (go.Pointer<go.math.big.Int>);
    @:native("Sign") function sign(): (go.GoInt);
    @:native("Sqrt") function sqrt(x: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("String") function string(): (String);
    @:native("Sub") function sub(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);
    @:native("Text") function text(base: go.GoInt): (String);
    @:native("TrailingZeroBits") function trailingZeroBits(): (go.GoUInt);
    @:native("Uint64") function uint64(): (go.UInt64);
    @:native("UnmarshalJSON") function unmarshalJSON(text: go.Slice<go.Byte>): (go.Error);
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): (go.Error);
    @:native("Xor") function xor(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Int>);

}