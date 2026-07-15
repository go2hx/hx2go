package go.vendor.golang.org.x.text.transform;

@:go.Type({ name: "Transformer", instanceName: "transform.Transformer", imports: ["vendor/golang.org/x/text/transform"] })
extern typedef Transformer = {

    @:native("Reset") function reset(): Void;
    @:go.Tuple("nDst", "nSrc", "err") @:native("Transform") function transform(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>, atEOF: Bool): go.Tuple<{ nDst: go.GoInt, nSrc: go.GoInt, err: go.Error }>;

}