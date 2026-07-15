package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "OPTResource", instanceName: "dnsmessage.OPTResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class OPTResource {

    @:native("Options") var options: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Option>;

function new(options: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Option>);

    @:native("GoString") function goString(): String;

}