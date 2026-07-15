package go.syscall;

@:structInit
@:go.Type({ name: "SysProcIDMap", instanceName: "syscall.SysProcIDMap", imports: ["syscall"] })
extern class SysProcIDMap {

    @:native("ContainerID") var containerID: go.GoInt;
    @:native("HostID") var hostID: go.GoInt;
    @:native("Size") var size: go.GoInt;

function new(containerID: go.GoInt, hostID: go.GoInt, size: go.GoInt);

}