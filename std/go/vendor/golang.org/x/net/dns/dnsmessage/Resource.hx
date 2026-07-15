package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Resource", instanceName: "dnsmessage.Resource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Resource {

    @:native("Header") var header: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader;
    @:native("Body") var body: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceBody;

function new(header: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, body: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceBody);

    @:native("GoString") function goString(): String;

}