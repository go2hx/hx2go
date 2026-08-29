package go.os.user;

/**
    UnknownGroupIdError is returned by [LookupGroupId] when
    a group cannot be found.
**/
@:go.Type({ name: "UnknownGroupIdError", instanceName: "user.UnknownGroupIdError", imports: ["os/user"] })
extern typedef UnknownGroupIdError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>