package go.vendor.golang.org.x.text;

@:go.Type({ name: "transform", instanceName: "transform.transform", imports: ["vendor/golang.org/x/text/transform"] })
extern class Transform {

    @:native("Discard") static var Discard: go.vendor.golang.org.x.text.transform.Transformer;
    @:native("Nop") static var Nop: go.vendor.golang.org.x.text.transform.SpanningTransformer;

    @:go.Tuple("result", "n", "err") @:native("Append") static function append(t: go.vendor.golang.org.x.text.transform.Transformer, dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.Tuple<{ result: go.Slice<go.Byte>, n: go.GoInt, err: go.Error }>;
    @:go.Tuple("result", "n", "err") @:native("Bytes") static function bytes(t: go.vendor.golang.org.x.text.transform.Transformer, b: go.Slice<go.Byte>): go.Tuple<{ result: go.Slice<go.Byte>, n: go.GoInt, err: go.Error }>;
    @:native("Chain") static function chain(t: haxe.Rest<go.vendor.golang.org.x.text.transform.Transformer>): go.vendor.golang.org.x.text.transform.Transformer;
    @:native("NewReader") static function newReader(r: go.io.Reader, t: go.vendor.golang.org.x.text.transform.Transformer): go.Pointer<go.vendor.golang.org.x.text.transform.Reader>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer, t: go.vendor.golang.org.x.text.transform.Transformer): go.Pointer<go.vendor.golang.org.x.text.transform.Writer>;
    @:native("RemoveFunc") static function removeFunc(f: (r: go.Rune) -> Bool): go.vendor.golang.org.x.text.transform.Transformer;
    @:go.Tuple("result", "n", "err") @:native("String") static function string(t: go.vendor.golang.org.x.text.transform.Transformer, s: String): go.Tuple<{ result: String, n: go.GoInt, err: go.Error }>;

}