package go.vendor.golang.org.x.text.unicode.bidi;

@:structInit
@:go.Type({ name: "Paragraph", instanceName: "bidi.Paragraph", imports: ["vendor/golang.org/x/text/unicode/bidi"] })
extern class Paragraph {

    @:native("Direction") function direction(): go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("IsLeftToRight") function isLeftToRight(): Bool;
    @:native("Line") function line(start: go.GoInt, end: go.GoInt): go.Result<go.vendor.golang.org.x.text.unicode.bidi.Ordering>;
    @:native("Order") function order(): go.Result<go.vendor.golang.org.x.text.unicode.bidi.Ordering>;
    @:native("RunAt") function runAt(pos: go.GoInt): go.vendor.golang.org.x.text.unicode.bidi.Run;
    @:native("SetBytes") function setBytes(b: go.Slice<go.Byte>, opts: haxe.Rest<go.vendor.golang.org.x.text.unicode.bidi.Option>): go.Result<go.GoInt>;
    @:native("SetString") function setString(s: String, opts: haxe.Rest<go.vendor.golang.org.x.text.unicode.bidi.Option>): go.Result<go.GoInt>;

}