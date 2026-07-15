package go.vendor.golang.org.x.text.transform;

@:go.Type({ name: "SpanningTransformer", instanceName: "transform.SpanningTransformer", imports: ["vendor/golang.org/x/text/transform"] })
extern typedef SpanningTransformer = {

    @:native("Reset") function reset(): Void;
    @:native("Span") function span(src: go.Slice<go.Byte>, atEOF: Bool): go.Result<go.GoInt>;
    @:go.Tuple("nDst", "nSrc", "err") @:native("Transform") function transform(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>, atEOF: Bool): go.Tuple<{ nDst: go.GoInt, nSrc: go.GoInt, err: go.Error }>;

}