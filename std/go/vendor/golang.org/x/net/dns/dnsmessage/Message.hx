package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Message", instanceName: "dnsmessage.Message", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Message {

    @:native("Header") var header: go.vendor.golang.org.x.net.dns.dnsmessage.Header;
    @:native("Questions") var questions: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Question>;
    @:native("Answers") var answers: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>;
    @:native("Authorities") var authorities: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>;
    @:native("Additionals") var additionals: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>;

function new(header: go.vendor.golang.org.x.net.dns.dnsmessage.Header, questions: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Question>, answers: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>, authorities: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>, additionals: go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>);

    @:native("AppendPack") function appendPack(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("GoString") function goString(): String;
    @:native("Pack") function pack(): go.Result<go.Slice<go.Byte>>;
    @:native("Unpack") function unpack(msg: go.Slice<go.Byte>): go.Error;

}