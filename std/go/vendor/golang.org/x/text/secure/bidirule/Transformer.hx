package go.vendor.golang.org.x.text.secure.bidirule;

@:structInit
@:go.Type({ name: "Transformer", instanceName: "bidirule.Transformer", imports: ["vendor/golang.org/x/text/secure/bidirule"] })
extern class Transformer {

    @:native("Reset") function reset(): Void;
    @:native("Span") function span(src: go.Slice<go.Byte>, atEOF: Bool): go.Result<go.GoInt>;
    @:go.Tuple("nDst", "nSrc", "err") @:native("Transform") function transform(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>, atEOF: Bool): go.Tuple<{ nDst: go.GoInt, nSrc: go.GoInt, err: go.Error }>;

}