package go.vendor.golang.org.x.text.transform;

@:structInit
@:go.Type({ name: "Reader", instanceName: "transform.Reader", imports: ["vendor/golang.org/x/text/transform"] })
extern class Reader {

    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}