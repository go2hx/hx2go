package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "CNAMEResource", instanceName: "dnsmessage.CNAMEResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class CNAMEResource {

    @:native("CNAME") var CNAME: go.vendor.golang.org.x.net.dns.dnsmessage.Name;

function new(CNAME: go.vendor.golang.org.x.net.dns.dnsmessage.Name);

    @:native("GoString") function goString(): String;

}