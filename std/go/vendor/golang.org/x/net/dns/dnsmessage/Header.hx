package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Header", instanceName: "dnsmessage.Header", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Header {

    @:native("ID") var ID: go.UInt16;
    @:native("Response") var response: Bool;
    @:native("OpCode") var opCode: go.vendor.golang.org.x.net.dns.dnsmessage.OpCode;
    @:native("Authoritative") var authoritative: Bool;
    @:native("Truncated") var truncated: Bool;
    @:native("RecursionDesired") var recursionDesired: Bool;
    @:native("RecursionAvailable") var recursionAvailable: Bool;
    @:native("AuthenticData") var authenticData: Bool;
    @:native("CheckingDisabled") var checkingDisabled: Bool;
    @:native("RCode") var rCode: go.vendor.golang.org.x.net.dns.dnsmessage.RCode;

function new(ID: go.UInt16, response: Bool, opCode: go.vendor.golang.org.x.net.dns.dnsmessage.OpCode, authoritative: Bool, truncated: Bool, recursionDesired: Bool, recursionAvailable: Bool, authenticData: Bool, checkingDisabled: Bool, rCode: go.vendor.golang.org.x.net.dns.dnsmessage.RCode);

    @:native("GoString") function goString(): String;

}