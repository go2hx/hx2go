package go.net.http.cookiejar;

@:structInit
@:go.Type({ name: "entry", instanceName: "cookiejar.entry", imports: ["net/http/cookiejar"] })
extern class Entry {

    @:native("Name") var name: String;
    @:native("Value") var value: String;
    @:native("Quoted") var quoted: Bool;
    @:native("Domain") var domain: String;
    @:native("Path") var path: String;
    @:native("SameSite") var sameSite: String;
    @:native("Secure") var secure: Bool;
    @:native("HttpOnly") var httpOnly: Bool;
    @:native("Persistent") var persistent: Bool;
    @:native("HostOnly") var hostOnly: Bool;
    @:native("Expires") var expires: go.time.Time;
    @:native("Creation") var creation: go.time.Time;
    @:native("LastAccess") var lastAccess: go.time.Time;

    function new(name: String="", value: String="", quoted: Bool=false, domain: String="", path: String="", sameSite: String="", secure: Bool=false, httpOnly: Bool=false, persistent: Bool=false, hostOnly: Bool=false, expires: go.time.Time, creation: go.time.Time, lastAccess: go.time.Time);

}