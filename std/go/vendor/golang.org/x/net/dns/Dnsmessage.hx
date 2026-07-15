package go.vendor.golang.org.x.net.dns;

@:go.Type({ name: "dnsmessage", instanceName: "dnsmessage.dnsmessage", imports: ["vendor/golang.org/x/net/dns/dnsmessage"] })
extern class Dnsmessage {

    @:native("ClassANY") static var ClassANY: go.vendor.golang.org.x.net.dns.dnsmessage.Class;
    @:native("ClassCHAOS") static var ClassCHAOS: go.vendor.golang.org.x.net.dns.dnsmessage.Class;
    @:native("ClassCSNET") static var ClassCSNET: go.vendor.golang.org.x.net.dns.dnsmessage.Class;
    @:native("ClassHESIOD") static var ClassHESIOD: go.vendor.golang.org.x.net.dns.dnsmessage.Class;
    @:native("ClassINET") static var ClassINET: go.vendor.golang.org.x.net.dns.dnsmessage.Class;
    @:native("RCodeFormatError") static var RCodeFormatError: go.vendor.golang.org.x.net.dns.dnsmessage.RCode;
    @:native("RCodeNameError") static var RCodeNameError: go.vendor.golang.org.x.net.dns.dnsmessage.RCode;
    @:native("RCodeNotImplemented") static var RCodeNotImplemented: go.vendor.golang.org.x.net.dns.dnsmessage.RCode;
    @:native("RCodeRefused") static var RCodeRefused: go.vendor.golang.org.x.net.dns.dnsmessage.RCode;
    @:native("RCodeServerFailure") static var RCodeServerFailure: go.vendor.golang.org.x.net.dns.dnsmessage.RCode;
    @:native("RCodeSuccess") static var RCodeSuccess: go.vendor.golang.org.x.net.dns.dnsmessage.RCode;
    @:native("SVCParamALPN") static var SVCParamALPN: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamDOHPath") static var SVCParamDOHPath: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamECH") static var SVCParamECH: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamIPv4Hint") static var SVCParamIPv4Hint: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamIPv6Hint") static var SVCParamIPv6Hint: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamMandatory") static var SVCParamMandatory: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamNoDefaultALPN") static var SVCParamNoDefaultALPN: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamOHTTP") static var SVCParamOHTTP: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamPort") static var SVCParamPort: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("SVCParamTLSSupportedGroups") static var SVCParamTLSSupportedGroups: go.vendor.golang.org.x.net.dns.dnsmessage.SVCParamKey;
    @:native("TypeA") static var TypeA: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeAAAA") static var TypeAAAA: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeALL") static var TypeALL: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeAXFR") static var TypeAXFR: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeCNAME") static var TypeCNAME: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeHINFO") static var TypeHINFO: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeHTTPS") static var TypeHTTPS: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeMINFO") static var TypeMINFO: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeMX") static var TypeMX: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeNS") static var TypeNS: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeOPT") static var TypeOPT: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypePTR") static var TypePTR: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeSOA") static var TypeSOA: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeSRV") static var TypeSRV: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeSVCB") static var TypeSVCB: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeTXT") static var TypeTXT: go.vendor.golang.org.x.net.dns.dnsmessage.Type;
    @:native("TypeWKS") static var TypeWKS: go.vendor.golang.org.x.net.dns.dnsmessage.Type;

    @:native("MustNewName") static function mustNewName(name: String): go.vendor.golang.org.x.net.dns.dnsmessage.Name;
    @:native("NewBuilder") static function newBuilder(buf: go.Slice<go.Byte>, h: go.vendor.golang.org.x.net.dns.dnsmessage.Header): go.vendor.golang.org.x.net.dns.dnsmessage.Builder;
    @:native("NewName") static function newName(name: String): go.Result<go.vendor.golang.org.x.net.dns.dnsmessage.Name>;

}