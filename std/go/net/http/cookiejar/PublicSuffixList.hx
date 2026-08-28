package go.net.http.cookiejar;

/**
    PublicSuffixList provides the public suffix of a domain. For example:
      - the public suffix of "example.com" is "com",
      - the public suffix of "foo1.foo2.foo3.co.uk" is "co.uk", and
      - the public suffix of "bar.pvt.k12.ma.us" is "pvt.k12.ma.us".
    
    Implementations of PublicSuffixList must be safe for concurrent use by
    multiple goroutines.
    
    An implementation that always returns "" is valid and may be useful for
    testing but it is not secure: it means that the HTTP server for foo.com can
    set a cookie for bar.com.
    
    A public suffix list implementation is in the package
    golang.org/x/net/publicsuffix.
**/
@:go.Type({ name: "PublicSuffixList", instanceName: "cookiejar.PublicSuffixList", imports: ["net/http/cookiejar"] })
extern typedef PublicSuffixList = {

    @:native("PublicSuffix") function publicSuffix(domain: String): (String);
    @:native("String") function string(): (String);

}