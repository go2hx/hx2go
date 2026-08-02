package go.image.gif;

@:go.Type({ name: "writer", instanceName: "gif.writer", imports: ["image/gif"] })
extern typedef Writer = {

    @:native("Flush") function flush(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);

}