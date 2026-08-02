package go.image.gif;

@:go.Type({ name: "reader", instanceName: "gif.reader", imports: ["image/gif"] })
extern typedef Reader = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);

}