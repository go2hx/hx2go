package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Option", instanceName: "dnsmessage.Option", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Option {

    @:native("Code") var code: go.UInt16;
    @:native("Data") var data: go.Slice<go.Byte>;

function new(code: go.UInt16, data: go.Slice<go.Byte>);

    @:native("GoString") function goString(): String;

}