package go.vendor.golang.org.x.text.secure;

@:go.Type({ name: "bidirule", instanceName: "bidirule.bidirule", imports: ["vendor/golang.org/x/text/secure/bidirule"] })
extern class Bidirule {

    @:native("Direction") static function direction(b: go.Slice<go.Byte>): go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("DirectionString") static function directionString(s: String): go.vendor.golang.org.x.text.unicode.bidi.Direction;
    @:native("New") static function _new(): go.Pointer<go.vendor.golang.org.x.text.secure.bidirule.Transformer>;
    @:native("Valid") static function valid(b: go.Slice<go.Byte>): Bool;
    @:native("ValidString") static function validString(s: String): Bool;

}