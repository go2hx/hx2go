package go.os.user;

/**
    UnknownGroupError is returned by [LookupGroup] when
    a group cannot be found.
**/
@:go.Type({ name: "UnknownGroupError", instanceName: "user.UnknownGroupError", imports: ["os/user"] })
extern typedef UnknownGroupError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>