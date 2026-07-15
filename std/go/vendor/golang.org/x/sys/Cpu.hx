package go.vendor.golang.org.x.sys;

@:go.Type({ name: "cpu", instanceName: "cpu.cpu", imports: ["vendor/golang.org/x/sys/cpu"] })
extern class Cpu {

    @:native("IsBigEndian") static var IsBigEndian: Bool;

    @:native("ARM") static var ARM: Dynamic;
    @:native("ARM64") static var ARM64: Dynamic;
    @:native("Initialized") static var Initialized: Bool;
    @:native("Loong64") static var Loong64: Dynamic;
    @:native("MIPS64X") static var MIPS64X: Dynamic;
    @:native("PPC64") static var PPC64: Dynamic;
    @:native("RISCV64") static var RISCV64: Dynamic;
    @:native("S390X") static var S390X: Dynamic;
    @:native("X86") static var X86: Dynamic;

}