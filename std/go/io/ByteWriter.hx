package go.io;

@:go.Type({ name: "ByteWriter", instanceName: "io.ByteWriter", imports: ["io"] })
extern typedef ByteWriter = {

    @:native("WriteByte") function writeByte(c: go.Byte): go.Error;

}