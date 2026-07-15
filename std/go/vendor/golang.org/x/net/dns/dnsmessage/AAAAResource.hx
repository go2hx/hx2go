package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "AAAAResource", instanceName: "dnsmessage.AAAAResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class AAAAResource {

    @:native("AAAA") var AAAA: go.GoArray<go.Byte, 16>;

function new(AAAA: go.GoArray<go.Byte, 16>);

    @:native("GoString") function goString(): String;

}