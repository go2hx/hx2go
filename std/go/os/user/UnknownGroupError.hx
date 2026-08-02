package go.os.user;

@:go.Type({ name: "UnknownGroupError", instanceName: "user.UnknownGroupError", imports: ["os/user"] })
extern typedef UnknownGroupError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>