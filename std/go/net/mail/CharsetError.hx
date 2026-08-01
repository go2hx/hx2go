package go.net.mail;

@:go.Type({ name: "charsetError", instanceName: "mail.charsetError", imports: ["net/mail"] })
extern typedef CharsetError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>