package go.os;

@:go.Type({ name: "user", instanceName: "user.user", imports: ["os/user"] })
extern class User {

    @:native("Current") static function current(): go.Result<go.Pointer<go.os.user.User>>;
    @:native("Lookup") static function lookup(username: String): go.Result<go.Pointer<go.os.user.User>>;
    @:native("LookupGroup") static function lookupGroup(name: String): go.Result<go.Pointer<go.os.user.Group>>;
    @:native("LookupGroupId") static function lookupGroupId(gid: String): go.Result<go.Pointer<go.os.user.Group>>;
    @:native("LookupId") static function lookupId(uid: String): go.Result<go.Pointer<go.os.user.User>>;

}