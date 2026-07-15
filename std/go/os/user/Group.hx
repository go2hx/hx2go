package go.os.user;

@:structInit
@:go.Type({ name: "Group", instanceName: "user.Group", imports: ["os/user"] })
extern class Group {

    @:native("Gid") var gid: String;
    @:native("Name") var name: String;

function new(gid: String, name: String);

}