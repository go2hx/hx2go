package go.compress.lzw;

@:go.Type({ name: "writer", instanceName: "lzw.writer", imports: ["compress/lzw"] })
extern typedef Writer_ = {

    @:native("Flush") function flush(): (go.Error);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);

}