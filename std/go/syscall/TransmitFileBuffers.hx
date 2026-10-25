package go.syscall;

@:structInit
@:go.Type({ name: "TransmitFileBuffers", instanceName: "syscall.TransmitFileBuffers", imports: ["syscall"] })
extern class TransmitFileBuffers {

    @:native("Head") var head: go.UIntPtr;
    @:native("HeadLength") var headLength: go.UInt32;
    @:native("Tail") var tail: go.UIntPtr;
    @:native("TailLength") var tailLength: go.UInt32;

    function new(head: go.UIntPtr=0, headLength: go.UInt32=0, tail: go.UIntPtr=0, tailLength: go.UInt32=0);

}