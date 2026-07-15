package go.vendor.golang.org.x.text.unicode.bidi;

@:structInit
@:go.Type({ name: "Run", instanceName: "bidi.Run", imports: ["vendor/golang.org/x/text/unicode/bidi"] })
extern class Run {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Direction") function direction(): go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:go.Tuple("start", "end") @:native("Pos") function pos(): go.Tuple<{ start: go.GoInt, end: go.GoInt }>;
    @:native("String") function string(): String;

}