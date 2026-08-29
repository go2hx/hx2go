package go.os.user;

/**
    UnknownUserIdError is returned by [LookupId] when a user cannot be found.
**/
@:go.Type({ name: "UnknownUserIdError", instanceName: "user.UnknownUserIdError", imports: ["os/user"] })
extern typedef UnknownUserIdError = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);

}>