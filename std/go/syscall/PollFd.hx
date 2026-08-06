package go.syscall;

@:structInit
@:go.Type({ name: "pollFd", instanceName: "syscall.pollFd", imports: ["syscall"] })
extern class PollFd {

    @:native("Fd") var fd: go.Int32;
    @:native("Events") var events: go.Int16;
    @:native("Revents") var revents: go.Int16;

    function new(fd: go.Int32, events: go.Int16, revents: go.Int16);

}