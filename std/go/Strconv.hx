package go;

@:go.Type({ name: "strconv", instanceName: "strconv.strconv", imports: ["strconv"] })
extern class Strconv {

    @:native("IntSize") static var IntSize: go.GoInt;

    @:native("AppendBool") static function appendBool(dst: go.Slice<go.Byte>, b: Bool): go.Slice<go.Byte>;
    @:native("AppendFloat") static function appendFloat(dst: go.Slice<go.Byte>, f: Float, fmt: go.Byte, prec: go.GoInt, bitSize: go.GoInt): go.Slice<go.Byte>;
    @:native("AppendInt") static function appendInt(dst: go.Slice<go.Byte>, i: go.Int64, base: go.GoInt): go.Slice<go.Byte>;
    @:native("AppendQuote") static function appendQuote(dst: go.Slice<go.Byte>, s: String): go.Slice<go.Byte>;
    @:native("AppendQuoteRune") static function appendQuoteRune(dst: go.Slice<go.Byte>, r: go.Rune): go.Slice<go.Byte>;
    @:native("AppendQuoteRuneToASCII") static function appendQuoteRuneToASCII(dst: go.Slice<go.Byte>, r: go.Rune): go.Slice<go.Byte>;
    @:native("AppendQuoteRuneToGraphic") static function appendQuoteRuneToGraphic(dst: go.Slice<go.Byte>, r: go.Rune): go.Slice<go.Byte>;
    @:native("AppendQuoteToASCII") static function appendQuoteToASCII(dst: go.Slice<go.Byte>, s: String): go.Slice<go.Byte>;
    @:native("AppendQuoteToGraphic") static function appendQuoteToGraphic(dst: go.Slice<go.Byte>, s: String): go.Slice<go.Byte>;
    @:native("AppendUint") static function appendUint(dst: go.Slice<go.Byte>, i: go.UInt64, base: go.GoInt): go.Slice<go.Byte>;
    @:native("Atoi") static function atoi(s: String): go.Result<go.GoInt>;
    @:native("CanBackquote") static function canBackquote(s: String): Bool;
    @:native("FormatBool") static function formatBool(b: Bool): String;
    @:native("FormatComplex") static function formatComplex(c: go.Complex128, fmt: go.Byte, prec: go.GoInt, bitSize: go.GoInt): String;
    @:native("FormatFloat") static function formatFloat(f: Float, fmt: go.Byte, prec: go.GoInt, bitSize: go.GoInt): String;
    @:native("FormatInt") static function formatInt(i: go.Int64, base: go.GoInt): String;
    @:native("FormatUint") static function formatUint(i: go.UInt64, base: go.GoInt): String;
    @:native("IsGraphic") static function isGraphic(r: go.Rune): Bool;
    @:native("IsPrint") static function isPrint(r: go.Rune): Bool;
    @:native("Itoa") static function itoa(i: go.GoInt): String;
    @:native("ParseBool") static function parseBool(str: String): go.Result<Bool>;
    @:native("ParseComplex") static function parseComplex(s: String, bitSize: go.GoInt): go.Result<go.Complex128>;
    @:native("ParseFloat") static function parseFloat(s: String, bitSize: go.GoInt): go.Result<Float>;
    @:native("ParseInt") static function parseInt(s: String, base: go.GoInt, bitSize: go.GoInt): go.Result<go.Int64>;
    @:native("ParseUint") static function parseUint(s: String, base: go.GoInt, bitSize: go.GoInt): go.Result<go.UInt64>;
    @:native("Quote") static function quote(s: String): String;
    @:native("QuoteRune") static function quoteRune(r: go.Rune): String;
    @:native("QuoteRuneToASCII") static function quoteRuneToASCII(r: go.Rune): String;
    @:native("QuoteRuneToGraphic") static function quoteRuneToGraphic(r: go.Rune): String;
    @:native("QuoteToASCII") static function quoteToASCII(s: String): String;
    @:native("QuoteToGraphic") static function quoteToGraphic(s: String): String;
    @:native("QuotedPrefix") static function quotedPrefix(s: String): go.Result<String>;
    @:native("Unquote") static function unquote(s: String): go.Result<String>;
    @:go.Tuple("value", "multibyte", "tail", "err") @:native("UnquoteChar") static function unquoteChar(s: String, quote: go.Byte): go.Tuple<{ value: go.Rune, multibyte: Bool, tail: String, err: go.Error }>;

}