package go.net.http.cookiejar;

/**
    Options are the options for creating a new Jar.
**/
@:structInit
@:go.Type({ name: "Options", instanceName: "cookiejar.Options", imports: ["net/http/cookiejar"] })
extern class Options {

    @:native("PublicSuffixList") var publicSuffixList: go.net.http.cookiejar.PublicSuffixList;

    function new(publicSuffixList: go.net.http.cookiejar.PublicSuffixList=null);

}