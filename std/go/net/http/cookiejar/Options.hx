package go.net.http.cookiejar;

@:structInit
@:go.Type({ name: "Options", instanceName: "cookiejar.Options", imports: ["net/http/cookiejar"] })
extern class Options {

    @:native("PublicSuffixList") var publicSuffixList: go.net.http.cookiejar.PublicSuffixList;

function new(publicSuffixList: go.net.http.cookiejar.PublicSuffixList);

}