package go.image.gif;

@:structInit
@:go.Type({ name: "blockWriter", instanceName: "gif.blockWriter", imports: ["image/gif"] })
extern class BlockWriter {

    @:native("Flush") function flush(): (go.Error);
    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);

}