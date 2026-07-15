package go.internal.runtime.syscall.linux;

@:structInit
@:go.Type({ name: "Utsname", instanceName: "linux.Utsname", imports: ["internal/runtime/syscall/linux"] })
extern class Utsname {

    @:native("Sysname") var sysname: go.GoArray<go.Byte, 65>;
    @:native("Nodename") var nodename: go.GoArray<go.Byte, 65>;
    @:native("Release") var release: go.GoArray<go.Byte, 65>;
    @:native("Version") var version: go.GoArray<go.Byte, 65>;
    @:native("Machine") var machine: go.GoArray<go.Byte, 65>;
    @:native("Domainname") var domainname: go.GoArray<go.Byte, 65>;

function new(sysname: go.GoArray<go.Byte, 65>, nodename: go.GoArray<go.Byte, 65>, release: go.GoArray<go.Byte, 65>, version: go.GoArray<go.Byte, 65>, machine: go.GoArray<go.Byte, 65>, domainname: go.GoArray<go.Byte, 65>);

}