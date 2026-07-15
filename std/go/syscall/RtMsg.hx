package go.syscall;

@:structInit
@:go.Type({ name: "RtMsg", instanceName: "syscall.RtMsg", imports: ["syscall"] })
extern class RtMsg {

    @:native("Family") var family: go.UInt8;
    @:native("Dst_len") var dst_len: go.UInt8;
    @:native("Src_len") var src_len: go.UInt8;
    @:native("Tos") var tos: go.UInt8;
    @:native("Table") var table: go.UInt8;
    @:native("Protocol") var protocol: go.UInt8;
    @:native("Scope") var scope: go.UInt8;
    @:native("Type") var type: go.UInt8;
    @:native("Flags") var flags: go.UInt32;

function new(family: go.UInt8, dst_len: go.UInt8, src_len: go.UInt8, tos: go.UInt8, table: go.UInt8, protocol: go.UInt8, scope: go.UInt8, type: go.UInt8, flags: go.UInt32);

}