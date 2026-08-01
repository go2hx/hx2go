package go.mime.multipart;

@:structInit
@:go.Type({ name: "stickyErrorReader", instanceName: "multipart.stickyErrorReader", imports: ["mime/multipart"] })
extern class StickyErrorReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}