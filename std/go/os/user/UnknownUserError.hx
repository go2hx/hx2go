package go.os.user;

@:go.Type({ name: "UnknownUserError", instanceName: "user.UnknownUserError", imports: ["os/user"] })
extern typedef UnknownUserError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>