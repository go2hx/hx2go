package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "MXResource", instanceName: "dnsmessage.MXResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class MXResource {

    @:native("Pref") var pref: go.UInt16;
    @:native("MX") var MX: go.vendor.golang.org.x.net.dns.dnsmessage.Name;

function new(pref: go.UInt16, MX: go.vendor.golang.org.x.net.dns.dnsmessage.Name);

    @:native("GoString") function goString(): String;

}