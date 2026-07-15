package go.debug.macho;

@:structInit
@:go.Type({ name: "RegsAMD64", instanceName: "macho.RegsAMD64", imports: ["debug/macho"] })
extern class RegsAMD64 {

    @:native("AX") var AX: go.UInt64;
    @:native("BX") var BX: go.UInt64;
    @:native("CX") var CX: go.UInt64;
    @:native("DX") var DX: go.UInt64;
    @:native("DI") var DI: go.UInt64;
    @:native("SI") var SI: go.UInt64;
    @:native("BP") var BP: go.UInt64;
    @:native("SP") var SP: go.UInt64;
    @:native("R8") var R8: go.UInt64;
    @:native("R9") var R9: go.UInt64;
    @:native("R10") var R10: go.UInt64;
    @:native("R11") var R11: go.UInt64;
    @:native("R12") var R12: go.UInt64;
    @:native("R13") var R13: go.UInt64;
    @:native("R14") var R14: go.UInt64;
    @:native("R15") var R15: go.UInt64;
    @:native("IP") var IP: go.UInt64;
    @:native("FLAGS") var FLAGS: go.UInt64;
    @:native("CS") var CS: go.UInt64;
    @:native("FS") var FS: go.UInt64;
    @:native("GS") var GS: go.UInt64;

function new(AX: go.UInt64, BX: go.UInt64, CX: go.UInt64, DX: go.UInt64, DI: go.UInt64, SI: go.UInt64, BP: go.UInt64, SP: go.UInt64, R8: go.UInt64, R9: go.UInt64, R10: go.UInt64, R11: go.UInt64, R12: go.UInt64, R13: go.UInt64, R14: go.UInt64, R15: go.UInt64, IP: go.UInt64, FLAGS: go.UInt64, CS: go.UInt64, FS: go.UInt64, GS: go.UInt64);

}