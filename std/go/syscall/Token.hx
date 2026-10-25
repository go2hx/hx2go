package go.syscall;

/**
    An access token contains the security information for a logon session.
    The system creates an access token when a user logs on, and every
    process executed on behalf of the user has a copy of the token.
    The token identifies the user, the user's groups, and the user's
    privileges. The system uses the token to control access to securable
    objects and to control the ability of the user to perform various
    system-related operations on the local computer.
**/
@:go.Type({ name: "Token", instanceName: "syscall.Token", imports: ["syscall"] })
extern typedef Token = haxe.extern.EitherType<go.UIntPtr, {
    /**
        Close releases access to access token.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        GetTokenPrimaryGroup retrieves access token t primary group information.
        A pointer to a SID structure representing a group that will become
        the primary group of any objects created by a process using this access token.
    **/
    @:native("GetTokenPrimaryGroup") function getTokenPrimaryGroup(): (go.Result<go.Pointer<go.syscall.Tokenprimarygroup_>>);
    /**
        GetTokenUser retrieves access token t user account information.
    **/
    @:native("GetTokenUser") function getTokenUser(): (go.Result<go.Pointer<go.syscall.Tokenuser_>>);
    /**
        GetUserProfileDirectory retrieves path to the
        root directory of the access token t user's profile.
    **/
    @:native("GetUserProfileDirectory") function getUserProfileDirectory(): (go.Result<String>);

}>