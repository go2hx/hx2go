package go.math.big.internal.asmgen;

@:structInit
@:go.Type({ name: "Asm", instanceName: "asmgen.Asm", imports: ["math/big/internal/asmgen"] })
extern class Asm {

    @:native("Arch") var arch: go.Pointer<go.math.big.internal.asmgen.Arch>;

function new(arch: go.Pointer<go.math.big.internal.asmgen.Arch>);

    @:native("Add") function add(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg, carry: go.math.big.internal.asmgen.Carry): Void;
    @:native("AddWords") function addWords(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.RegPtr, dst: go.math.big.internal.asmgen.RegPtr): Void;
    @:native("AltCarry") function altCarry(): go.math.big.internal.asmgen.Reg;
    @:native("And") function and(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("Carry") function carry(): go.math.big.internal.asmgen.Reg;
    @:native("ClearCarry") function clearCarry(which: go.math.big.internal.asmgen.Carry): Void;
    @:native("Comment") function comment(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("ConvertCarry") function convertCarry(which: go.math.big.internal.asmgen.Carry, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("EOL") function EOL(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Enabled") function enabled(option: go.math.big.internal.asmgen.Option): Bool;
    @:native("Fatalf") function fatalf(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Free") function free(r: go.math.big.internal.asmgen.Reg): Void;
    @:native("FreeAll") function freeAll(): Void;
    @:native("Func") function func(decl: String): go.Pointer<go.math.big.internal.asmgen.Func>;
    @:native("HasRegShift") function hasRegShift(): Bool;
    @:native("Imm") function imm(x: go.GoInt): go.math.big.internal.asmgen.Reg;
    @:native("IsZero") function isZero(r: go.math.big.internal.asmgen.Reg): Bool;
    @:native("Jmp") function jmp(label: String): Void;
    @:native("JmpEnable") function jmpEnable(option: go.math.big.internal.asmgen.Option, label: String): Bool;
    @:native("JmpNonZero") function jmpNonZero(src: go.math.big.internal.asmgen.Reg, label: String): Void;
    @:native("JmpZero") function jmpZero(src: go.math.big.internal.asmgen.Reg, label: String): Void;
    @:native("Label") function label(name: String): Void;
    @:native("Lsh") function lsh(shift: go.math.big.internal.asmgen.Reg, src: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("LshReg") function lshReg(shift: go.math.big.internal.asmgen.Reg, src: go.math.big.internal.asmgen.Reg): go.math.big.internal.asmgen.Reg;
    @:native("LshWide") function lshWide(shift: go.math.big.internal.asmgen.Reg, adj: go.math.big.internal.asmgen.Reg, src: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("Mov") function mov(src: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("MulWide") function mulWide(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.Reg, dstlo: go.math.big.internal.asmgen.Reg, dsthi: go.math.big.internal.asmgen.Reg): Void;
    @:native("Neg") function neg(src: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("Or") function or(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("Printf") function printf(format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Reg") function reg(): go.math.big.internal.asmgen.Reg;
    @:native("RegHint") function regHint(hint: go.math.big.internal.asmgen.Hint): go.math.big.internal.asmgen.Reg;
    @:native("RegsUsed") function regsUsed(): go.math.big.internal.asmgen.RegsUsed;
    @:native("RestoreCarry") function restoreCarry(src: go.math.big.internal.asmgen.Reg): Void;
    @:native("Ret") function ret(): Void;
    @:native("Rsh") function rsh(shift: go.math.big.internal.asmgen.Reg, src: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("RshReg") function rshReg(shift: go.math.big.internal.asmgen.Reg, src: go.math.big.internal.asmgen.Reg): go.math.big.internal.asmgen.Reg;
    @:native("RshWide") function rshWide(shift: go.math.big.internal.asmgen.Reg, adj: go.math.big.internal.asmgen.Reg, src: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("SLTU") function SLTU(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("SaveCarry") function saveCarry(dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("SaveConvertCarry") function saveConvertCarry(which: go.math.big.internal.asmgen.Carry, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("SetOption") function setOption(option: go.math.big.internal.asmgen.Option, on: Bool): Void;
    @:native("SetRegsUsed") function setRegsUsed(used: go.math.big.internal.asmgen.RegsUsed): Void;
    @:native("Sub") function sub(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg, carry: go.math.big.internal.asmgen.Carry): Void;
    @:native("Unfree") function unfree(r: go.math.big.internal.asmgen.Reg): Void;
    @:native("Xor") function xor(src1: go.math.big.internal.asmgen.Reg, src2: go.math.big.internal.asmgen.Reg, dst: go.math.big.internal.asmgen.Reg): Void;
    @:native("ZR") function ZR(): go.math.big.internal.asmgen.Reg;

}