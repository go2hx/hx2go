package go.archive.tar;

@:structInit
@:go.Type({ name: "Reader", instanceName: "tar.Reader", imports: ["archive/tar"] })
extern class Reader {

    @:native("Next") function next(): go.Result<go.Pointer<go.archive.tar.Header>>;
    @:native("Read") function read(b: go.Slice<go.Byte>): go.Result<go.GoInt>;

}