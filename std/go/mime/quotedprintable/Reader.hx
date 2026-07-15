package go.mime.quotedprintable;

@:structInit
@:go.Type({ name: "Reader", instanceName: "quotedprintable.Reader", imports: ["mime/quotedprintable"] })
extern class Reader {

    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}