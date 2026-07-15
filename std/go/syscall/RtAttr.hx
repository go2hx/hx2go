package go.syscall;

@:structInit
@:go.Type({ name: "RtAttr", instanceName: "syscall.RtAttr", imports: ["syscall"] })
extern class RtAttr {

    @:native("Len") var len: go.UInt16;
    @:native("Type") var type: go.UInt16;

function new(len: go.UInt16, type: go.UInt16);

}