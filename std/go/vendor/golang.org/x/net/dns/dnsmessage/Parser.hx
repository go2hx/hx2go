package go.vendor.golang.org.x.net.dns.dnsmessage;

@:structInit
@:go.Type({ name: "Parser", instanceName: "dnsmessage.Parser", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Parser {

    @:native("AAAAResource") function aAAAResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.AAAAResource>;
    @:native("AResource") function aResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.AResource>;
    @:native("Additional") function additional(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>;
    @:native("AdditionalHeader") function additionalHeader(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader>;
    @:native("AllAdditionals") function allAdditionals(): go.Result<go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>>;
    @:native("AllAnswers") function allAnswers(): go.Result<go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>>;
    @:native("AllAuthorities") function allAuthorities(): go.Result<go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>>;
    @:native("AllQuestions") function allQuestions(): go.Result<go.Slice<go.vendor.golang.org.x.net.dns.dnsmessage.Question>>;
    @:native("Answer") function answer(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>;
    @:native("AnswerHeader") function answerHeader(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader>;
    @:native("Authority") function authority(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.Resource>;
    @:native("AuthorityHeader") function authorityHeader(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.ResourceHeader>;
    @:native("CNAMEResource") function cNAMEResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.CNAMEResource>;
    @:native("HTTPSResource") function hTTPSResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.HTTPSResource>;
    @:native("MXResource") function mXResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.MXResource>;
    @:native("NSResource") function nSResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.NSResource>;
    @:native("OPTResource") function oPTResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.OPTResource>;
    @:native("PTRResource") function pTRResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.PTRResource>;
    @:native("Question") function question(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.Question>;
    @:native("SOAResource") function sOAResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.SOAResource>;
    @:native("SRVResource") function sRVResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.SRVResource>;
    @:native("SVCBResource") function sVCBResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.SVCBResource>;
    @:native("SkipAdditional") function skipAdditional(): go.Error;
    @:native("SkipAllAdditionals") function skipAllAdditionals(): go.Error;
    @:native("SkipAllAnswers") function skipAllAnswers(): go.Error;
    @:native("SkipAllAuthorities") function skipAllAuthorities(): go.Error;
    @:native("SkipAllQuestions") function skipAllQuestions(): go.Error;
    @:native("SkipAnswer") function skipAnswer(): go.Error;
    @:native("SkipAuthority") function skipAuthority(): go.Error;
    @:native("SkipQuestion") function skipQuestion(): go.Error;
    @:native("Start") function start(msg: go.Slice<go.Byte>): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.Header>;
    @:native("TXTResource") function tXTResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.TXTResource>;
    @:native("UnknownResource") function unknownResource(): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.UnknownResource>;

}