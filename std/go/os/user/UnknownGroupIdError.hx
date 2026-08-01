package go.os.user;

@:go.Type({ name: "UnknownGroupIdError", instanceName: "user.UnknownGroupIdError", imports: ["os/user"] })
extern typedef UnknownGroupIdError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>