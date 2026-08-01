package go.image.gif;

@:structInit
@:go.Type({ name: "blockReader", instanceName: "gif.blockReader", imports: ["image/gif"] })
extern class BlockReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);

}