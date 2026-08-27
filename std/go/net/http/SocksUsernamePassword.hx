package go.net.http;

@:structInit
@:go.Type({ name: "socksUsernamePassword", instanceName: "http.socksUsernamePassword", imports: ["net/http"] })
extern class SocksUsernamePassword {

    @:native("Username") var username: String;
    @:native("Password") var password: String;

    function new(username: String="", password: String="");

    @:native("Authenticate") function authenticate(ctx: go.context.Context, rw: go.io.ReadWriter, auth: go.net.http.SocksAuthMethod): (go.Error);

}