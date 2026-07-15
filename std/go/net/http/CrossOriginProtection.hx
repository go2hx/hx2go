package go.net.http;

@:structInit
@:go.Type({ name: "CrossOriginProtection", instanceName: "http.CrossOriginProtection", imports: ["net/http"] })
extern class CrossOriginProtection {

    @:native("AddInsecureBypassPattern") function addInsecureBypassPattern(pattern: String): Void;
    @:native("AddTrustedOrigin") function addTrustedOrigin(origin: String): go.Error;
    @:native("Check") function check(req: go.Pointer<go.net.http.Request>): go.Error;
    @:native("Handler") function handler(h: go.net.http.Handler): go.net.http.Handler;
    @:native("SetDenyHandler") function setDenyHandler(h: go.net.http.Handler): Void;

}