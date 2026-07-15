package go.net.mail;

@:structInit
@:go.Type({ name: "Message", instanceName: "mail.Message", imports: ["net/mail"] })
extern class Message {

    @:native("Header") var header: go.net.mail.Header;
    @:native("Body") var body: go.io.Reader;

function new(header: go.net.mail.Header, body: go.io.Reader);

}