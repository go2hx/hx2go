package go.vendor.golang.org.x.text.unicode.norm;

@:structInit
@:go.Type({ name: "Properties", instanceName: "norm.Properties", imports: ["vendor/golang.org/x/text/unicode/norm"] })
extern class Properties {

    @:native("BoundaryAfter") function boundaryAfter(): Bool;
    @:native("BoundaryBefore") function boundaryBefore(): Bool;
    @:native("CCC") function CCC(): go.UInt8;
    @:native("Decomposition") function decomposition(): go.Slice<go.Byte>;
    @:native("LeadCCC") function leadCCC(): go.UInt8;
    @:native("Size") function size(): go.GoInt;
    @:native("TrailCCC") function trailCCC(): go.UInt8;

}