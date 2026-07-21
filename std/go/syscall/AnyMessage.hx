package go.syscall;

@:structInit
@:go.Type({ name: "anyMessage", instanceName: "syscall.anyMessage", imports: ["syscall"] })
extern class AnyMessage {

    @:native("Msglen") var msglen: go.UInt16;
    @:native("Version") var version: go.UInt8;
    @:native("Type") var type: go.UInt8;

    function new(msglen: go.UInt16, version: go.UInt8, type: go.UInt8);

}