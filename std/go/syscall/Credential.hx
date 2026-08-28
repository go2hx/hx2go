package go.syscall;

/**
    Credential holds user and group identities to be assumed
    by a child process started by [StartProcess].
**/
@:structInit
@:go.Type({ name: "Credential", instanceName: "syscall.Credential", imports: ["syscall"] })
extern class Credential {

    @:native("Uid") var uid: go.UInt32;
    @:native("Gid") var gid: go.UInt32;
    @:native("Groups") var groups: go.Slice<go.UInt32>;
    @:native("NoSetGroups") var noSetGroups: Bool;

    function new(uid: go.UInt32=0, gid: go.UInt32=0, groups: go.Slice<go.UInt32>=null, noSetGroups: Bool=false);

}