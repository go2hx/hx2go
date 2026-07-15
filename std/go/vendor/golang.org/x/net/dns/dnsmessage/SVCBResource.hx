package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "SVCBResource", instanceName: "dnsmessage.SVCBResource", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class SVCBResource {

    @:native("Priority") var priority: go.UInt16;
    @:native("Target") var target: go.vendor.golang.org.x.net.dns.dnsmessage.Name;
    @:native("Params") var params: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.SVCParam>;

function new(priority: go.UInt16, target: go.vendor.golang.org.x.net.dns.dnsmessage.Name, params: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.SVCParam>);

    @:native("DeleteParam") function deleteParam(key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey): Bool;
    @:go.Tuple("value", "ok") @:native("GetParam") function getParam(key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey): go.Tuple<{ value: go.Slice<go.Byte>, ok: Bool }>;
    @:native("GoString") function goString(): String;
    @:native("SetParam") function setParam(key: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey, value: go.Slice<go.Byte>): Void;

}