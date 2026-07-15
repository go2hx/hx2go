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
    @:native("Pdeathsig") var pdeathsig: go.syscall.Signal;
    @:native("Cloneflags") var cloneflags: go.UIntPtr;
    @:native("Unshareflags") var unshareflags: go.UIntPtr;
    @:native("UidMappings") var uidMappings: go.Slice<go.syscall.SysProcIDMap>;
    @:native("GidMappings") var gidMappings: go.Slice<go.syscall.SysProcIDMap>;
    @:native("GidMappingsEnableSetgroups") var gidMappingsEnableSetgroups: Bool;
    @:native("AmbientCaps") var ambientCaps: go.Slice<go.UIntPtr>;
    @:native("UseCgroupFD") var useCgroupFD: Bool;
    @:native("CgroupFD") var cgroupFD: go.GoInt;
    @:native("PidFD") var pidFD: go.Pointer<go.GoInt>;

function new(chroot: String, credential: go.Pointer<go.syscall.Credential>, ptrace: Bool, setsid: Bool, setpgid: Bool, setctty: Bool, noctty: Bool, ctty: go.GoInt, foreground: Bool, pgid: go.GoInt, pdeathsig: go.syscall.Signal, cloneflags: go.UIntPtr, unshareflags: go.UIntPtr, uidMappings: go.Slice<go.syscall.SysProcIDMap>, gidMappings: go.Slice<go.syscall.SysProcIDMap>, gidMappingsEnableSetgroups: Bool, ambientCaps: go.Slice<go.UIntPtr>, useCgroupFD: Bool, cgroupFD: go.GoInt, pidFD: go.Pointer<go.GoInt>);

}