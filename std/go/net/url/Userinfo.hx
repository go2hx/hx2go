package go.net.url;

/**
    The Userinfo type is an immutable encapsulation of username and
    password details for a [URL]. An existing Userinfo value is guaranteed
    to have a username set (potentially empty, as allowed by RFC 2396),
    and optionally a password.
**/
@:structInit
@:go.Type({ name: "Userinfo", instanceName: "url.Userinfo", imports: ["net/url"] })
extern class Userinfo {

    /**
        Password returns the password in case it is set, and whether it is set.
    **/
    @:go.Tuple("p0", "p1") @:native("Password") function password(): (go.Tuple<{ p0: String, p1: Bool }>);
    /**
        String returns the encoded userinfo information in the standard form
        of "username[:password]".
    **/
    @:native("String") function string(): (String);
    /**
        Username returns the username.
    **/
    @:native("Username") function username(): (String);

}