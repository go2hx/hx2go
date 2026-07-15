package go.fmt;

@:go.Type({ name: "ScanState", instanceName: "fmt.ScanState", imports: ["fmt"] })
extern typedef ScanState = {

    @:native("Read") function read(buf: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>;
    @:native("SkipSpace") function skipSpace(): Void;
    @:native("Token") function token(skipSpace: Bool, f: (p0: go.Rune) -> Bool): go.Result<go.Slice<go.Byte>>;
    @:native("UnreadRune") function unreadRune(): go.Error;
    @:go.Tuple("wid", "ok") @:native("Width") function width(): go.Tuple<{ wid: go.GoInt, ok: Bool }>;

}