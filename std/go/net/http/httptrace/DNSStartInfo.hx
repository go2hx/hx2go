package go.net.http.httptrace;

/**
    DNSStartInfo contains information about a DNS request.
**/
@:structInit
@:go.Type({ name: "DNSStartInfo", instanceName: "httptrace.DNSStartInfo", imports: ["net/http/httptrace"] })
extern class DNSStartInfo {

    @:native("Host") var host: String;

    function new(host: String="");

}