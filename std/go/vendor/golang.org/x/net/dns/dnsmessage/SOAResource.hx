package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "SOAResource", instanceName: "dnsmessage.SOAResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class SOAResource {

    @:native("NS") var NS: go.vendor.golang.org.x.net.dns.dnsmessage.Name;
    @:native("MBox") var mBox: go.vendor.golang.org.x.net.dns.dnsmessage.Name;
    @:native("Serial") var serial: go.UInt32;
    @:native("Refresh") var refresh: go.UInt32;
    @:native("Retry") var retry: go.UInt32;
    @:native("Expire") var expire: go.UInt32;
    @:native("MinTTL") var minTTL: go.UInt32;

function new(NS: go.vendor.golang.org.x.net.dns.dnsmessage.Name, mBox: go.vendor.golang.org.x.net.dns.dnsmessage.Name, serial: go.UInt32, refresh: go.UInt32, retry: go.UInt32, expire: go.UInt32, minTTL: go.UInt32);

    @:native("GoString") function goString(): String;

}