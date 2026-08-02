package go.compress.bzip2;

@:structInit
@:go.Type({ name: "reader", instanceName: "bzip2.reader", imports: ["compress/bzip2"] })
extern class Reader {

    @:native("Read") function read(buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}