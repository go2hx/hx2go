package go.io;

@:go.Type({ name: "ByteReader", instanceName: "io.ByteReader", imports: ["io"] })
extern typedef ByteReader = {

    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);

}