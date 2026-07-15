package go.io;

@:go.Type({ name: "ByteScanner", instanceName: "io.ByteScanner", imports: ["io"] })
extern typedef ByteScanner = {

    @:native("ReadByte") function readByte(): go.Result<go.Byte>;
    @:native("UnreadByte") function unreadByte(): go.Error;

}