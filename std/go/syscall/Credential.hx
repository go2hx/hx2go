package go.syscall;

@:structInit
@:go.Type({ name: "Credential", instanceName: "syscall.Credential", imports: ["syscall"] })
extern class Credential {

    @:native("Uid") var uid: go.UInt32;
    @:native("Gid") var gid: go.UInt32;
    @:native("Groups") var groups: go.Slice<go.UInt32>;
    @:native("NoSetGroups") var noSetGroups: Bool;

function new(uid: go.UInt32, gid: go.UInt32, groups: go.Slice<go.UInt32>, noSetGroups: Bool);

}