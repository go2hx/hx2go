package go.syscall;

@:structInit
@:go.Type({ name: "sysLinger", instanceName: "syscall.sysLinger", imports: ["syscall"] })
extern class SysLinger {

    @:native("Onoff") var onoff: go.UInt16;
    @:native("Linger") var linger: go.UInt16;

    function new(onoff: go.UInt16=0, linger: go.UInt16=0);

}