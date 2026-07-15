package go.syscall;

@:structInit
@:go.Type({ name: "NlAttr", instanceName: "syscall.NlAttr", imports: ["syscall"] })
extern class NlAttr {

    @:native("Len") var len: go.UInt16;
    @:native("Type") var type: go.UInt16;

function new(len: go.UInt16, type: go.UInt16);

}