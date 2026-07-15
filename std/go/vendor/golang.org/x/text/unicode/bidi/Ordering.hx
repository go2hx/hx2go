package go.vendor.golang.org.x.text.unicode.bidi;

@:structInit
@:go.Type({ name: "Ordering", instanceName: "bidi.Ordering", imports: ["vendor/golang.org/x/text/unicode/bidi"] })
extern class Ordering {

    @:native("Direction") function direction(): go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("NumRuns") function numRuns(): go.GoInt;
    @:native("Run") function run(i: go.GoInt): go.vendor.golang.org.x.text.unicode.bidi.Run;

}