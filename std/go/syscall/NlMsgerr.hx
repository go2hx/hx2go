package go.syscall;

@:structInit
@:go.Type({ name: "NlMsgerr", instanceName: "syscall.NlMsgerr", imports: ["syscall"] })
extern class NlMsgerr {

    @:native("Error") var error: go.Int32;
    @:native("Msg") var msg: go.syscall.NlMsghdr;

function new(error: go.Int32, msg: go.syscall.NlMsghdr);

}