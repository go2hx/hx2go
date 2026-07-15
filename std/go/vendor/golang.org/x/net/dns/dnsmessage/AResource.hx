package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "AResource", instanceName: "dnsmessage.AResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class AResource {

    @:native("A") var A: go.GoArray<go.Byte, 4>;

function new(A: go.GoArray<go.Byte, 4>);

    @:native("GoString") function goString(): String;

}