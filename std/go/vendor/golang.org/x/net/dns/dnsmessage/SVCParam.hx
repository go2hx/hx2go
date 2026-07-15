package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "SVCParam", instanceName: "dnsmessage.SVCParam", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class SVCParam {

    @:native("Key") var key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("Value") var value: go.Slice<go.Byte>;

function new(key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey, value: go.Slice<go.Byte>);

    @:native("GoString") function goString(): String;

}