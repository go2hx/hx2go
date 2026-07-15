package go.debug.macho;

@:structInit
@:go.Type({ name: "Regs386", instanceName: "macho.Regs386", imports: ["debug/macho"] })
extern class Regs386 {

    @:native("AX") var AX: go.UInt32;
    @:native("BX") var BX: go.UInt32;
    @:native("CX") var CX: go.UInt32;
    @:native("DX") var DX: go.UInt32;
    @:native("DI") var DI: go.UInt32;
    @:native("SI") var SI: go.UInt32;
    @:native("BP") var BP: go.UInt32;
    @:native("SP") var SP: go.UInt32;
    @:native("SS") var SS: go.UInt32;
    @:native("FLAGS") var FLAGS: go.UInt32;
    @:native("IP") var IP: go.UInt32;
    @:native("CS") var CS: go.UInt32;
    @:native("DS") var DS: go.UInt32;
    @:native("ES") var ES: go.UInt32;
    @:native("FS") var FS: go.UInt32;
    @:native("GS") var GS: go.UInt32;

function new(AX: go.UInt32, BX: go.UInt32, CX: go.UInt32, DX: go.UInt32, DI: go.UInt32, SI: go.UInt32, BP: go.UInt32, SP: go.UInt32, SS: go.UInt32, FLAGS: go.UInt32, IP: go.UInt32, CS: go.UInt32, DS: go.UInt32, ES: go.UInt32, FS: go.UInt32, GS: go.UInt32);

}