package go.syscall;

@:structInit
@:go.Type({ name: "UserInfo10", instanceName: "syscall.UserInfo10", imports: ["syscall"] })
extern class UserInfo10 {

    @:native("Name") var name: go.Pointer<go.UInt16>;
    @:native("Comment") var comment: go.Pointer<go.UInt16>;
    @:native("UsrComment") var usrComment: go.Pointer<go.UInt16>;
    @:native("FullName") var fullName: go.Pointer<go.UInt16>;

    function new(name: go.Pointer<go.UInt16>=null, comment: go.Pointer<go.UInt16>=null, usrComment: go.Pointer<go.UInt16>=null, fullName: go.Pointer<go.UInt16>=null);

}