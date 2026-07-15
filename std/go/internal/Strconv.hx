package go.internal;

@:go.Type({ name: "strconv", instanceName: "strconv.strconv", imports: ["internal/strconv"] })
extern class Strconv {

    @:native("ErrBase") static var ErrBase: go.internal.strconv.Error;
    @:native("ErrBitSize") static var ErrBitSize: go.internal.strconv.Error;
    @:native("ErrRange") static var ErrRange: go.internal.strconv.Error;
    @:native("ErrSyntax") static var ErrSyntax: go.internal.strconv.Error;
    @:native("IntSize") static var IntSize: go.GoInt;

    @:native("AppendBool") static function appendBool(dst: go.Slice<go.Byte>, b: Bool): go.Slice<go.Byte>;
    @:native("AppendComplex") static function appendComplex(dst: go.Slice<go.Byte>, c: go.Complex128, fmt: go.Byte, prec: go.GoInt, bitSize: go.GoInt): go.Slice<go.Byte>;
    @:native("AppendFloat") static function appendFloat(dst: go.Slice<go.Byte>, f: Float, fmt: go.Byte, prec: go.GoInt, bitSize: go.GoInt): go.Slice<go.Byte>;
    @:native("AppendInt") static function appendInt(dst: go.Slice<go.Byte>, i: go.Int64, base: go.GoInt): go.Slice<go.Byte>;
    @:native("AppendUint") static function appendUint(dst: go.Slice<go.Byte>, i: go.UInt64, base: go.GoInt): go.Slice<go.Byte>;
    @:native("Atoi") static function atoi(s: String): go.Result<go.GoInt>;
    @:native("FormatBool") static function formatBool(b: Bool): String;
    @:native("FormatComplex") static function formatComplex(c: go.Complex128, fmt: go.Byte, prec: go.GoInt, bitSize: go.GoInt): String;
    @:native("FormatFloat") static function formatFloat(f: Float, fmt: go.Byte, prec: go.GoInt, bitSize: go.GoInt): String;
    @:native("FormatInt") static function formatInt(i: go.Int64, base: go.GoInt): String;
    @:native("FormatUint") static function formatUint(i: go.UInt64, base: go.GoInt): String;
    @:native("Itoa") static function itoa(i: go.GoInt): String;
    @:native("ParseBool") static function parseBool(str: String): go.Result<Bool>;
    @:native("ParseComplex") static function parseComplex(s: String, bitSize: go.GoInt): go.Result<go.Complex128>;
    @:native("ParseFloat") static function parseFloat(s: String, bitSize: go.GoInt): go.Result<Float>;
    @:native("ParseInt") static function parseInt(s: String, base: go.GoInt, bitSize: go.GoInt): go.Result<go.Int64>;
    @:native("ParseUint") static function parseUint(s: String, base: go.GoInt, bitSize: go.GoInt): go.Result<go.UInt64>;
    @:native("RuntimeFormatBase10") static function runtimeFormatBase10(a: go.Slice<go.Byte>, u: go.UInt64): go.GoInt;

}