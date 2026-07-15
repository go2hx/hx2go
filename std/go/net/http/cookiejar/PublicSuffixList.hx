package go.net.http.cookiejar;

@:go.Type({ name: "PublicSuffixList", instanceName: "cookiejar.PublicSuffixList", imports: ["net/http/cookiejar"] })
extern typedef PublicSuffixList = {

    @:native("PublicSuffix") function publicSuffix(domain: String): String;
    @:native("String") function string(): String;

}