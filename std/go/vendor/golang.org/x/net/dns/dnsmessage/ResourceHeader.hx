package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "ResourceHeader", instanceName: "dnsmessage.ResourceHeader", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class ResourceHeader {

    @:native("Name") var name: go.vendor.golang.org.x.net.dns.dnsmessage.Name;
    @:native("Type") var type: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("Class") var _class: go.vendor.golang.org.x.net.dns.dnsmessage.Class;
    @:native("TTL") var TTL: go.UInt32;
    @:native("Length") var length: go.UInt16;

function new(name: go.vendor.golang.org.x.net.dns.dnsmessage.Name, type: go.vendor.golang.org.x.net.dns.dnsmessage.Type, _class: go.vendor.golang.org.x.net.dns.dnsmessage.Class, TTL: go.UInt32, length: go.UInt16);

    @:native("DNSSECAllowed") function dNSSECAllowed(): Bool;
    @:native("ExtendedRCode") function extendedRCode(rcode: go.vendor.golang.org.x.net.dns.dnsmessage.RCode): go.vendor.golang.org.x.net.dns.dnsmessage.RCode;
    @:native("GoString") function goString(): String;
    @:native("SetEDNS0") function setEDNS0(udpPayloadLen: go.GoInt, extRCode: go.vendor.golang.org.x.net.dns.dnsmessage.RCode, dnssecOK: Bool): go.Error;

}