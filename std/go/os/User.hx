package go.os;

/**
    Package user allows user account lookups by name or id.
    
    For most Unix systems, this package has two internal implementations of
    resolving user and group ids to names, and listing supplementary group IDs.
    One is written in pure Go and parses /etc/passwd and /etc/group. The other
    is cgo-based and relies on the standard C library (libc) routines such as
    getpwuid_r, getgrnam_r, and getgrouplist.
    
    When cgo is available, and the required routines are implemented in libc
    for a particular platform, cgo-based (libc-backed) code is used.
    This can be overridden by using osusergo build tag, which enforces
    the pure Go implementation.
**/
@:go.Type({ name: "user", instanceName: "user.user", imports: ["os/user"] })
extern class User {

    /**
        Current returns the current user.
        
        The first call will cache the current user information.
        Subsequent calls will return the cached value and will not reflect
        changes to the current user.
    **/
    @:native("Current") static function current(): (go.Result<go.Pointer<go.os.user.User>>);
    /**
        Lookup looks up a user by username. If the user cannot be found, the
        returned error is of type [UnknownUserError].
    **/
    @:native("Lookup") static function lookup(username: String): (go.Result<go.Pointer<go.os.user.User>>);
    /**
        LookupGroup looks up a group by name. If the group cannot be found, the
        returned error is of type [UnknownGroupError].
    **/
    @:native("LookupGroup") static function lookupGroup(name: String): (go.Result<go.Pointer<go.os.user.Group>>);
    /**
        LookupGroupId looks up a group by groupid. If the group cannot be found, the
        returned error is of type [UnknownGroupIdError].
    **/
    @:native("LookupGroupId") static function lookupGroupId(gid: String): (go.Result<go.Pointer<go.os.user.Group>>);
    /**
        LookupId looks up a user by userid. If the user cannot be found, the
        returned error is of type [UnknownUserIdError].
    **/
    @:native("LookupId") static function lookupId(uid: String): (go.Result<go.Pointer<go.os.user.User>>);

}