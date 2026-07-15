package go.vendor.golang.org.x.text.unicode;

@:go.Type({ name: "bidi", instanceName: "bidi.bidi", imports: ["vendor/golang.org/x/text/unicode/bidi"] })
extern class Bidi {

    @:native("AL") static var AL: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("AN") static var AN: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("B") static var B: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("BN") static var BN: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("CS") static var CS: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("Control") static var Control: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("EN") static var EN: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("ES") static var ES: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("ET") static var ET: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("FSI") static var FSI: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("L") static var L: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("LRE") static var LRE: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("LRI") static var LRI: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("LRO") static var LRO: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("LeftToRight") static var LeftToRight: go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("Mixed") static var Mixed: go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("NSM") static var NSM: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("Neutral") static var Neutral: go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("ON") static var ON: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("PDF") static var PDF: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("PDI") static var PDI: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("R") static var R: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("RLE") static var RLE: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("RLI") static var RLI: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("RLO") static var RLO: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("RightToLeft") static var RightToLeft: go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("S") static var S: go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("UnicodeVersion") static var UnicodeVersion: String;
    @:native("WS") static var WS: go.vendor.golang.org.x.text.unicode.bidi.Class;

    @:native("AppendReverse") static function appendReverse(out: go.Slice<go.Byte>, _in: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("DefaultDirection") static function defaultDirection(d: go.vendor.golang.org.x.text.unicode.bidi.Direction): go.vendor.golang.org.x.text.unicode.bidi.Option;
    @:go.Tuple("p", "sz") @:native("Lookup") static function lookup(s: go.Slice<go.Byte>): go.Tuple<{ p: go.vendor.golang.org.x.text.unicode.bidi.Properties, sz: go.GoInt }>;
    @:go.Tuple("p", "size") @:native("LookupRune") static function lookupRune(r: go.Rune): go.Tuple<{ p: go.vendor.golang.org.x.text.unicode.bidi.Properties, size: go.GoInt }>;
    @:go.Tuple("p", "sz") @:native("LookupString") static function lookupString(s: String): go.Tuple<{ p: go.vendor.golang.org.x.text.unicode.bidi.Properties, sz: go.GoInt }>;
    @:native("ReverseString") static function reverseString(s: String): String;

}