package go.math.big.internal;

@:go.Type({ name: "asmgen", instanceName: "asmgen.asmgen", imports: ["math/big/internal/asmgen"] })
extern class Asmgen {

    @:native("AddCarry") static var AddCarry: go.math.big.internal.asmgen.Carry;
    @:native("AltCarry") static var AltCarry: go.math.big.internal.asmgen.Carry;
    @:native("HintAltCarry") static var HintAltCarry: go.math.big.internal.asmgen.Hint;
    @:native("HintCarry") static var HintCarry: go.math.big.internal.asmgen.Hint;
    @:native("HintMemOK") static var HintMemOK: go.math.big.internal.asmgen.Hint;
    @:native("HintMulHi") static var HintMulHi: go.math.big.internal.asmgen.Hint;
    @:native("HintMulSrc") static var HintMulSrc: go.math.big.internal.asmgen.Hint;
    @:native("HintNone") static var HintNone: go.math.big.internal.asmgen.Hint;
    @:native("HintShiftCount") static var HintShiftCount: go.math.big.internal.asmgen.Hint;
    @:native("KeepCarry") static var KeepCarry: go.math.big.internal.asmgen.Carry;
    @:native("OptionAltCarry") static var OptionAltCarry: go.math.big.internal.asmgen.Option;
    @:native("SetCarry") static var SetCarry: go.math.big.internal.asmgen.Carry;
    @:native("SmashCarry") static var SmashCarry: go.math.big.internal.asmgen.Carry;
    @:native("SubCarry") static var SubCarry: go.math.big.internal.asmgen.Carry;
    @:native("UseCarry") static var UseCarry: go.math.big.internal.asmgen.Carry;

    @:native("Arch386") static var Arch386: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchAMD64") static var ArchAMD64: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchARM") static var ArchARM: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchARM64") static var ArchARM64: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchLoong64") static var ArchLoong64: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchMIPS") static var ArchMIPS: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchMIPS64x") static var ArchMIPS64x: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchPPC64x") static var ArchPPC64x: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchRISCV64") static var ArchRISCV64: go.Pointer<go.math.big.internal.asmgen.Arch>;
    @:native("ArchS390X") static var ArchS390X: go.Pointer<go.math.big.internal.asmgen.Arch>;

    @:native("NewAsm") static function newAsm(arch: go.Pointer<go.math.big.internal.asmgen.Arch>): go.Pointer<go.math.big.internal.asmgen.Asm>;

}