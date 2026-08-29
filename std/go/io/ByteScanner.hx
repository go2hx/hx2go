package go.io;

/**
    ByteScanner is the interface that adds the UnreadByte method to the
    basic ReadByte method.
    
    UnreadByte causes the next call to ReadByte to return the last byte read.
    If the last operation was not a successful call to ReadByte, UnreadByte may
    return an error, unread the last byte read (or the byte prior to the
    last-unread byte), or (in implementations that support the [Seeker] interface)
    seek to one byte before the current offset.
**/
@:go.Type({ name: "ByteScanner", instanceName: "io.ByteScanner", imports: ["io"] })
extern typedef ByteScanner = {

    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    @:native("UnreadByte") function unreadByte(): (go.Error);

}