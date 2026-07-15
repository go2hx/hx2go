package go.vendor.golang.org.x.text.unicode;

@:go.Type({ name: "norm", instanceName: "norm.norm", imports: ["vendor/golang.org/x/text/unicode/norm"] })
extern class Norm {

    @:native("GraphemeJoiner") static var GraphemeJoiner: String;
    @:native("MaxSegmentSize") static var MaxSegmentSize: go.GoInt;
    @:native("MaxTransformChunkSize") static var MaxTransformChunkSize: go.GoInt;
    @:native("NFC") static var NFC: go.vendor.golang.org.x.text.unicode.norm.Form;
    @:native("NFD") static var NFD: go.vendor.golang.org.x.text.unicode.norm.Form;
    @:native("NFKC") static var NFKC: go.vendor.golang.org.x.text.unicode.norm.Form;
    @:native("NFKD") static var NFKD: go.vendor.golang.org.x.text.unicode.norm.Form;
    @:native("Version") static var Version: String;

}