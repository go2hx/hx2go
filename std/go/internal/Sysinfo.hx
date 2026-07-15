package go.internal;

@:go.Type({ name: "sysinfo", instanceName: "sysinfo.sysinfo", imports: ["internal/sysinfo"] })
extern class Sysinfo {

    @:native("CPUName") static var CPUName: () -> String;

}