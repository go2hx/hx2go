package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Builder", instanceName: "dnsmessage.Builder", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Builder {

    @:native("AAAAResource") function aAAAResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.AAAAResource): go.Error;
    @:native("AResource") function aResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.AResource): go.Error;
    @:native("CNAMEResource") function cNAMEResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.CNAMEResource): go.Error;
    @:native("EnableCompression") function enableCompression(): Void;
    @:native("Finish") function finish(): go.Result<go.Slice<go.Byte>>;
    @:native("HTTPSResource") function hTTPSResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.HTTPSResource): go.Error;
    @:native("MXResource") function mXResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.MXResource): go.Error;
    @:native("NSResource") function nSResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.NSResource): go.Error;
    @:native("OPTResource") function oPTResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.OPTResource): go.Error;
    @:native("PTRResource") function pTRResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.PTRResource): go.Error;
    @:native("Question") function question(q: go.vendor.golang.org.x.net.dns.dnsmessage.Question): go.Error;
    @:native("SOAResource") function sOAResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.SOAResource): go.Error;
    @:native("SRVResource") function sRVResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.SRVResource): go.Error;
    @:native("SVCBResource") function sVCBResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.SVCBResource): go.Error;
    @:native("StartAdditionals") function startAdditionals(): go.Error;
    @:native("StartAnswers") function startAnswers(): go.Error;
    @:native("StartAuthorities") function startAuthorities(): go.Error;
    @:native("StartQuestions") function startQuestions(): go.Error;
    @:native("TXTResource") function tXTResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.TXTResource): go.Error;
    @:native("UnknownResource") function unknownResource(h: go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader, r: go.vendor.golang.org.x.net.dns.dnsmessage.UnknownResource): go.Error;

}