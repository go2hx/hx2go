package go.vendor.golang.org.x.text.transform;

@:structInit
@:go.Type({ name: "Writer", instanceName: "transform.Writer", imports: ["vendor/golang.org/x/text/transform"] })
extern class Writer {

    @:native("Close") function close(): go.Error;
    @:native("Write") function write(data: go.Slice<go.Byte>): go.Result<go.GoInt>;

}