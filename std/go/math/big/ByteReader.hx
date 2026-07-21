package go.math.big;

@:structInit
@:go.Type({ name: "byteReader", instanceName: "big.byteReader", imports: ["math/big"] })
extern class ByteReader {

    @:native("ScanState") var scanState: go.fmt.ScanState;

    function new(scanState: go.fmt.ScanState);

    @:native("Read") function read(buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>);
    @:native("SkipSpace") function skipSpace(): Void;
    @:native("Token") function token(skipSpace: Bool, f: (p0: go.Rune) -> (Bool)): (go.Result<go.Slice<go.Byte>>);
    @:native("UnreadByte") function unreadByte(): (go.Error);
    @:native("UnreadRune") function unreadRune(): (go.Error);
    @:go.Tuple("wid", "ok") @:native("Width") function width(): (go.Tuple<{ wid: go.GoInt, ok: Bool }>);

}