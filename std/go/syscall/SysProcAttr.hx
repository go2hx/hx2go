package go.syscall;

@:structInit
@:go.Type({ name: "SysProcAttr", instanceName: "syscall.SysProcAttr", imports: ["syscall"] })
extern class SysProcAttr {

    @:native("Chroot") var chroot: String;
    @:native("Credential") var credential: go.Pointer<go.syscall.Credential>;
    @:native("Ptrace") var ptrace: Bool;
    @:native("Setsid") var setsid: Bool;
    @:native("Setpgid") var setpgid: Bool;
    @:native("Setctty") var setctty: Bool;
    @:native("Noctty") var noctty: Bool;
    @:native("Ctty") var ctty: go.GoInt;
    @:native("Foreground") var foreground: Bool;
    @:native("Pgid") var pgid: go.GoInt;

    function new(chroot: String, credential: go.Pointer<go.syscall.Credential>, ptrace: Bool, setsid: Bool, setpgid: Bool, setctty: Bool, noctty: Bool, ctty: go.GoInt, foreground: Bool, pgid: go.GoInt);

}