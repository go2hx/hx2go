package go.go;

@:go.Type({ name: "constant", instanceName: "constant.constant", imports: ["go/constant"] })
extern class Constant {

    @:native("Bool") static var Bool: go.go.constant.Kind;
    @:native("Complex") static var Complex: go.go.constant.Kind;
    @:native("Float") static var Float: go.go.constant.Kind;
    @:native("Int") static var Int: go.go.constant.Kind;
    @:native("String") static var String: go.go.constant.Kind;
    @:native("Unknown") static var Unknown: go.go.constant.Kind;

    @:native("BinaryOp") static function binaryOp(x_: go.go.constant.Value, op: go.go.token.Token, y_: go.go.constant.Value): go.go.constant.Value;
    @:native("BitLen") static function bitLen(x: go.go.constant.Value): go.GoInt;
    @:native("BoolVal") static function boolVal(x: go.go.constant.Value): Bool;
    @:native("Bytes") static function bytes(x: go.go.constant.Value): go.Slice<go.Byte>;
    @:native("Compare") static function compare(x_: go.go.constant.Value, op: go.go.token.Token, y_: go.go.constant.Value): Bool;
    @:native("Denom") static function denom(x: go.go.constant.Value): go.go.constant.Value;
    @:go.Tuple("p0", "p1") @:native("Float32Val") static function float32Val(x: go.go.constant.Value): go.Tuple<{ p0: go.Float32, p1: Bool }>;
    @:go.Tuple("p0", "p1") @:native("Float64Val") static function float64Val(x: go.go.constant.Value): go.Tuple<{ p0: Float, p1: Bool }>;
    @:native("Imag") static function imag(x: go.go.constant.Value): go.go.constant.Value;
    @:go.Tuple("p0", "p1") @:native("Int64Val") static function int64Val(x: go.go.constant.Value): go.Tuple<{ p0: go.Int64, p1: Bool }>;
    @:native("Make") static function make(x: Dynamic): go.go.constant.Value;
    @:native("MakeBool") static function makeBool(b: Bool): go.go.constant.Value;
    @:native("MakeFloat64") static function makeFloat64(x: Float): go.go.constant.Value;
    @:native("MakeFromBytes") static function makeFromBytes(bytes: go.Slice<go.Byte>): go.go.constant.Value;
    @:native("MakeFromLiteral") static function makeFromLiteral(lit: String, tok: go.go.token.Token, zero: go.GoUInt): go.go.constant.Value;
    @:native("MakeImag") static function makeImag(x: go.go.constant.Value): go.go.constant.Value;
    @:native("MakeInt64") static function makeInt64(x: go.Int64): go.go.constant.Value;
    @:native("MakeString") static function makeString(s: String): go.go.constant.Value;
    @:native("MakeUint64") static function makeUint64(x: go.UInt64): go.go.constant.Value;
    @:native("MakeUnknown") static function makeUnknown(): go.go.constant.Value;
    @:native("Num") static function num(x: go.go.constant.Value): go.go.constant.Value;
    @:native("Real") static function real(x: go.go.constant.Value): go.go.constant.Value;
    @:native("Shift") static function shift(x: go.go.constant.Value, op: go.go.token.Token, s: go.GoUInt): go.go.constant.Value;
    @:native("Sign") static function sign(x: go.go.constant.Value): go.GoInt;
    @:native("StringVal") static function stringVal(x: go.go.constant.Value): String;
    @:native("ToComplex") static function toComplex(x: go.go.constant.Value): go.go.constant.Value;
    @:native("ToFloat") static function toFloat(x: go.go.constant.Value): go.go.constant.Value;
    @:native("ToInt") static function toInt(x: go.go.constant.Value): go.go.constant.Value;
    @:go.Tuple("p0", "p1") @:native("Uint64Val") static function uint64Val(x: go.go.constant.Value): go.Tuple<{ p0: go.UInt64, p1: Bool }>;
    @:native("UnaryOp") static function unaryOp(op: go.go.token.Token, y: go.go.constant.Value, prec: go.GoUInt): go.go.constant.Value;
    @:native("Val") static function val(x: go.go.constant.Value): Dynamic;

}