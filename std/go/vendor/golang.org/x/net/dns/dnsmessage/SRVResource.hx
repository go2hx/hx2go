package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "SRVResource", instanceName: "dnsmessage.SRVResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class SRVResource {

    @:native("Priority") var priority: go.UInt16;
    @:native("Weight") var weight: go.UInt16;
    @:native("Port") var port: go.UInt16;
    @:native("Target") var target: go.vendor.golang.org.x.net.dns.dnsmessage.Name;

function new(priority: go.UInt16, weight: go.UInt16, port: go.UInt16, target: go.vendor.golang.org.x.net.dns.dnsmessage.Name);

    @:native("GoString") function goString(): String;

}