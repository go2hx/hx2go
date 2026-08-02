package go.os.user;

@:go.Type({ name: "UnknownUserIdError", instanceName: "user.UnknownUserIdError", imports: ["os/user"] })
extern typedef UnknownUserIdError = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);

}>