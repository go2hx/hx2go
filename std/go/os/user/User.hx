package go.os.user;

@:structInit
@:go.Type({ name: "User", instanceName: "user.User", imports: ["os/user"] })
extern class User {

    @:native("Uid") var uid: String;
    @:native("Gid") var gid: String;
    @:native("Username") var username: String;
    @:native("Name") var name: String;
    @:native("HomeDir") var homeDir: String;

function new(uid: String, gid: String, username: String, name: String, homeDir: String);

    @:native("GroupIds") function groupIds(): go.Result<go.Slice<String>>;

}