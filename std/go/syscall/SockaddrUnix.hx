package go.syscall;

@:structInit
@:go.Type({ name: "SockaddrUnix", instanceName: "syscall.SockaddrUnix", imports: ["syscall"] })
extern class SockaddrUnix {

    @:native("Name") var name: String;

function new(name: String);

}