package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Question", instanceName: "dnsmessage.Question", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Question {

    @:native("Name") var name: go.vendor.golang.org.x.net.dns.dnsmessage.Name;
    @:native("Type") var type: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("Class") var _class: go.vendor.golang.org.x.net.dns.dnsmessage.Class;

function new(name: go.vendor.golang.org.x.net.dns.dnsmessage.Name, type: go.vendor.golang.org.x.net.dns.dnsmessage.Type, _class: go.vendor.golang.org.x.net.dns.dnsmessage.Class);

    @:native("GoString") function goString(): String;

}