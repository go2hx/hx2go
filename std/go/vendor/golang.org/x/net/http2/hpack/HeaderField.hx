package go.vendor.golang.org.x.net.http2.hpack;

@:structInit
@:go.Type({ name: "HeaderField", instanceName: "hpack.HeaderField", imports: ["vendor/golang.org/x/net/http2/hpack"] })
extern class HeaderField {

    @:native("Name") var name: String;
    @:native("Value") var value: String;
    @:native("Sensitive") var sensitive: Bool;

function new(name: String, value: String, sensitive: Bool);

    @:native("IsPseudo") function isPseudo(): Bool;
    @:native("Size") function size(): go.UInt32;
    @:native("String") function string(): String;

}