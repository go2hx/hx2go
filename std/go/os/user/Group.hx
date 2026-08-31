package go.os.user;

/**
    Group represents a grouping of users.
    
    On POSIX systems Gid contains a decimal number representing the group ID.
**/
@:structInit
@:go.Type({ name: "Group", instanceName: "user.Group", imports: ["os/user"] })
extern class Group {

    @:native("Gid") var gid: String;
    @:native("Name") var name: String;

    function new(gid: String="", name: String="");

}