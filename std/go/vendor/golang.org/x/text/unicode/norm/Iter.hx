package go.vendor.golang.org.x.text.unicode.norm;

@:structInit
@:go.Type({ name: "Iter", instanceName: "norm.Iter", imports: ["vendor/golang.org/x/text/unicode/norm"] })
extern class Iter {

    @:native("Done") function done(): Bool;
    @:native("Init") function init(f: go.vendor.golang.org.x.text.unicode.norm.Form, src: go.Slice<go.Byte>): Void;
    @:native("InitString") function initString(f: go.vendor.golang.org.x.text.unicode.norm.Form, src: String): Void;
    @:native("Next") function next(): go.Slice<go.Byte>;
    @:native("Pos") function pos(): go.GoInt;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;

}