package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "NSResource", instanceName: "dnsmessage.NSResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class NSResource {

    @:native("NS") var NS: go.vendor.golang.org.x.net.dns.dnsmessage.Name;

function new(NS: go.vendor.golang.org.x.net.dns.dnsmessage.Name);

    @:native("GoString") function goString(): String;

}