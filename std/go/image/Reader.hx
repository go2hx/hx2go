package go.image;

@:go.Type({ name: "reader", instanceName: "image.reader", imports: ["image"] })
extern typedef Reader = {

    @:native("Peek") function peek(p0: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}