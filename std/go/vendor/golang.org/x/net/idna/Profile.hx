package go.vendor.golang.org.x.net.idna;

@:structInit
@:go.Type({ name: "Profile", instanceName: "idna.Profile", imports: ["vendor/golang.org/x/net/idna"] })
extern class Profile {

    @:native("String") function string(): String;
    @:native("ToASCII") function toASCII(s: String): go.Result<String>;
    @:native("ToUnicode") function toUnicode(s: String): go.Result<String>;

}