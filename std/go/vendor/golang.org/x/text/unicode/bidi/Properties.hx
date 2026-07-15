package go.vendor.golang.org.x.text.unicode.bidi;

@:structInit
@:go.Type({ name: "Properties", instanceName: "bidi.Properties", imports: ["vendor/golang.org/x/text/unicode/bidi"] })
extern class Properties {

    @:native("Class") function _class(): go.vendor.golang.org.x.text.unicode.bidi.Class;
    @:native("IsBracket") function isBracket(): Bool;
    @:native("IsOpeningBracket") function isOpeningBracket(): Bool;

}