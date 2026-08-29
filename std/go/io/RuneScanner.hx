package go.io;

/**
    RuneScanner is the interface that adds the UnreadRune method to the
    basic ReadRune method.
    
    UnreadRune causes the next call to ReadRune to return the last rune read.
    If the last operation was not a successful call to ReadRune, UnreadRune may
    return an error, unread the last rune read (or the rune prior to the
    last-unread rune), or (in implementations that support the [Seeker] interface)
    seek to the start of the rune before the current offset.
**/
@:go.Type({ name: "RuneScanner", instanceName: "io.RuneScanner", imports: ["io"] })
extern typedef RuneScanner = {

    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>);
    @:native("UnreadRune") function unreadRune(): (go.Error);

}