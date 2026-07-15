package go.syscall;

@:structInit
@:go.Type({ name: "Utsname", instanceName: "syscall.Utsname", imports: ["syscall"] })
extern class Utsname {

    @:native("Sysname") var sysname: go.GoArray<go.Int8, 65>;
    @:native("Nodename") var nodename: go.GoArray<go.Int8, 65>;
    @:native("Release") var release: go.GoArray<go.Int8, 65>;
    @:native("Version") var version: go.GoArray<go.Int8, 65>;
    @:native("Machine") var machine: go.GoArray<go.Int8, 65>;
    @:native("Domainname") var domainname: go.GoArray<go.Int8, 65>;

function new(sysname: go.GoArray<go.Int8, 65>, nodename: go.GoArray<go.Int8, 65>, release: go.GoArray<go.Int8, 65>, version: go.GoArray<go.Int8, 65>, machine: go.GoArray<go.Int8, 65>, domainname: go.GoArray<go.Int8, 65>);

}