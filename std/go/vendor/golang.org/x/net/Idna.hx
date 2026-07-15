package go.vendor.golang.org.x.net;

@:go.Type({ name: "idna", instanceName: "idna.idna", imports: ["vendor/golang.org/x/net/idna"] })
extern class Idna {

    @:native("UnicodeVersion") static var UnicodeVersion: String;

    @:native("Display") static var Display: go.Pointer<go.vendor.golang.org.x.net.idna.Profile>;
    @:native("Lookup") static var Lookup: go.Pointer<go.vendor.golang.org.x.net.idna.Profile>;
    @:native("Punycode") static var Punycode: go.Pointer<go.vendor.golang.org.x.net.idna.Profile>;
    @:native("Registration") static var Registration: go.Pointer<go.vendor.golang.org.x.net.idna.Profile>;

    @:native("BidiRule") static function bidiRule(): go.vendor.golang.org.x.net.idna.Option;
    @:native("CheckHyphens") static function checkHyphens(enable: Bool): go.vendor.golang.org.x.net.idna.Option;
    @:native("CheckJoiners") static function checkJoiners(enable: Bool): go.vendor.golang.org.x.net.idna.Option;
    @:native("MapForLookup") static function mapForLookup(): go.vendor.golang.org.x.net.idna.Option;
    @:native("New") static function _new(o: haxe.Rest<go.vendor.golang.org.x.net.idna.Option>): go.Pointer<go.vendor.golang.org.x.net.idna.Profile>;
    @:native("RemoveLeadingDots") static function removeLeadingDots(remove: Bool): go.vendor.golang.org.x.net.idna.Option;
    @:native("StrictDomainName") static function strictDomainName(use: Bool): go.vendor.golang.org.x.net.idna.Option;
    @:native("ToASCII") static function toASCII(s: String): go.Result<String>;
    @:native("ToUnicode") static function toUnicode(s: String): go.Result<String>;
    @:native("Transitional") static function transitional(transitional: Bool): go.vendor.golang.org.x.net.idna.Option;
    @:native("ValidateForRegistration") static function validateForRegistration(): go.vendor.golang.org.x.net.idna.Option;
    @:native("ValidateLabels") static function validateLabels(enable: Bool): go.vendor.golang.org.x.net.idna.Option;
    @:native("VerifyDNSLength") static function verifyDNSLength(verify: Bool): go.vendor.golang.org.x.net.idna.Option;

}