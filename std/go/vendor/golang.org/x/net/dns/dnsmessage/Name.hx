package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Name", instanceName: "dnsmessage.Name", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Name {

    @:native("Data") var data: go.GoArray<go.Byte, 255>;
    @:native("Length") var length: go.UInt8;

function new(data: go.GoArray<go.Byte, 255>, length: go.UInt8);

    @:native("GoString") function goString(): String;
    @:native("String") function string(): String;

}