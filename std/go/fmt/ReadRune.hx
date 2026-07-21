package go.fmt;

@:structInit
@:go.Type({ name: "readRune", instanceName: "fmt.readRune", imports: ["fmt"] })
extern class ReadRune {

    @:go.Tuple("rr", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ rr: go.Rune, size: go.GoInt, err: go.Error }>);
    @:native("UnreadRune") function unreadRune(): (go.Error);

}