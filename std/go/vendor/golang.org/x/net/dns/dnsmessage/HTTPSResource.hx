package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "HTTPSResource", instanceName: "dnsmessage.HTTPSResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class HTTPSResource {

    @:native("SVCBResource") var sVCBResource: go.vendor.golang.org.x.net.dns.dnsmessage.SVCBResource;

function new(sVCBResource: go.vendor.golang.org.x.net.dns.dnsmessage.SVCBResource);

    @:native("DeleteParam") function deleteParam(key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey): Bool;
    @:go.Tuple("value", "ok") @:native("GetParam") function getParam(key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey): go.Tuple<{ value: go.Slice<go.Byte>, ok: Bool }>;
    @:native("GoString") function goString(): String;
    @:native("SetParam") function setParam(key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey, value: go.Slice<go.Byte>): Void;

}