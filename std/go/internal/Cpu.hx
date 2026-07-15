package go.internal;

@:go.Type({ name: "cpu", instanceName: "cpu.cpu", imports: ["internal/cpu"] })
extern class Cpu {

    @:native("CacheLinePadSize") static var CacheLinePadSize: go.GoInt;

    @:native("ARM") static var ARM: Dynamic;
    @:native("ARM64") static var ARM64: Dynamic;
    @:native("CacheLineSize") static var CacheLineSize: go.UIntPtr;
    @:native("Loong64") static var Loong64: Dynamic;
    @:native("MIPS64X") static var MIPS64X: Dynamic;
    @:native("PPC64") static var PPC64: Dynamic;
    @:native("RISCV64") static var RISCV64: Dynamic;
    @:native("S390X") static var S390X: Dynamic;
    @:native("X86") static var X86: Dynamic;

    @:native("DataCacheSizes") static function dataCacheSizes(): go.Slice<go.UIntPtr>;
    @:native("Initialize") static function initialize(env: String): Void;
    @:native("Name") static function name(): String;

}