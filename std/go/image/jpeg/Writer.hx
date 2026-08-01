package go.image.jpeg;

@:go.Type({ name: "writer", instanceName: "jpeg.writer", imports: ["image/jpeg"] })
extern typedef Writer = {

    @:native("Flush") function flush(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);

}