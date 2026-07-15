package go.net;

@:go.Type({ name: "smtp", instanceName: "smtp.smtp", imports: ["net/smtp"] })
extern class Smtp {

    @:native("CRAMMD5Auth") static function cRAMMD5Auth(username: String, secret: String): go.net.smtp.Auth;
    @:native("Dial") static function dial(addr: String): go.Result<go.Pointer<go.net.smtp.Client>>;
    @:native("NewClient") static function newClient(conn: go.net.Conn, host: String): go.Result<go.Pointer<go.net.smtp.Client>>;
    @:native("PlainAuth") static function plainAuth(identity: String, username: String, password: String, host: String): go.net.smtp.Auth;
    @:native("SendMail") static function sendMail(addr: String, a: go.net.smtp.Auth, _from: String, _to: go.Slice<String>, msg: go.Slice<go.Byte>): go.Error;

}