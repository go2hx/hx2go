package go.io;

@:go.Type({ name: "RuneScanner", instanceName: "io.RuneScanner", imports: ["io"] })
extern typedef RuneScanner = {

    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>);
    @:native("UnreadRune") function unreadRune(): (go.Error);

}