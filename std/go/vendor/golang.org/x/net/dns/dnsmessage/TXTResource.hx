package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "TXTResource", instanceName: "dnsmessage.TXTResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class TXTResource {

    @:native("TXT") var TXT: go.Slice<String>;

function new(TXT: go.Slice<String>);

    @:native("GoString") function goString(): String;

}