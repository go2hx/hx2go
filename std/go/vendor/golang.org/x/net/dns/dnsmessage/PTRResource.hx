package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "PTRResource", instanceName: "dnsmessage.PTRResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class PTRResource {

    @:native("PTR") var PTR: go.vendor.golang.org.x.net.dns.dnsmessage.Name;

function new(PTR: go.vendor.golang.org.x.net.dns.dnsmessage.Name);

    @:native("GoString") function goString(): String;

}