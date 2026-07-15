package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "UnknownResource", instanceName: "dnsmessage.UnknownResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class UnknownResource {

    @:native("Type") var type: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("Data") var data: go.Slice<go.Byte>;

function new(type: go.vendor.golang.org.x.net.dns.dnsmessage.Type, data: go.Slice<go.Byte>);

    @:native("GoString") function goString(): String;

}