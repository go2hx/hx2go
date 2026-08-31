package go.net.smtp;

/**
    ServerInfo records information about an SMTP server.
**/
@:structInit
@:go.Type({ name: "ServerInfo", instanceName: "smtp.ServerInfo", imports: ["net/smtp"] })
extern class ServerInfo {

    @:native("Name") var name: String;
    @:native("TLS") var TLS: Bool;
    @:native("Auth") var auth: go.Slice<String>;

    function new(name: String="", TLS: Bool=false, auth: go.Slice<String>=null);

}