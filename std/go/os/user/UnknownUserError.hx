package go.os.user;

/**
    UnknownUserError is returned by [Lookup] when
    a user cannot be found.
**/
@:go.Type({ name: "UnknownUserError", instanceName: "user.UnknownUserError", imports: ["os/user"] })
extern typedef UnknownUserError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>