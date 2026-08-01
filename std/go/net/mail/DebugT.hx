package go.net.mail;

@:go.Type({ name: "debugT", instanceName: "mail.debugT", imports: ["net/mail"] })
extern typedef DebugT = haxe.extern.EitherType<Bool, {
    @:native("Printf") function printf(format: String, args: haxe.Rest<Dynamic>): Void;

}>