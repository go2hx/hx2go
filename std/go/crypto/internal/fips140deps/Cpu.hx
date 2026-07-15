package go.crypto.internal.fips140deps;

@:go.Type({ name: "cpu", instanceName: "cpu.cpu", imports: ["crypto/internal/fips140deps/cpu"] })
extern class Cpu {

    @:native("AMD64") static var AMD64: Bool;
    @:native("ARM64") static var ARM64: Bool;
    @:native("BigEndian") static var BigEndian: Bool;
    @:native("PPC64") static var PPC64: Bool;
    @:native("PPC64le") static var PPC64le: Bool;

    @:native("ARM64HasAES") static var ARM64HasAES: Bool;
    @:native("ARM64HasPMULL") static var ARM64HasPMULL: Bool;
    @:native("ARM64HasSHA2") static var ARM64HasSHA2: Bool;
    @:native("ARM64HasSHA3") static var ARM64HasSHA3: Bool;
    @:native("ARM64HasSHA512") static var ARM64HasSHA512: Bool;
    @:native("LOONG64HasLASX") static var LOONG64HasLASX: Bool;
    @:native("LOONG64HasLSX") static var LOONG64HasLSX: Bool;
    @:native("S390XHasAES") static var S390XHasAES: Bool;
    @:native("S390XHasAESCBC") static var S390XHasAESCBC: Bool;
    @:native("S390XHasAESCTR") static var S390XHasAESCTR: Bool;
    @:native("S390XHasAESGCM") static var S390XHasAESGCM: Bool;
    @:native("S390XHasECDSA") static var S390XHasECDSA: Bool;
    @:native("S390XHasGHASH") static var S390XHasGHASH: Bool;
    @:native("S390XHasSHA256") static var S390XHasSHA256: Bool;
    @:native("S390XHasSHA3") static var S390XHasSHA3: Bool;
    @:native("S390XHasSHA512") static var S390XHasSHA512: Bool;
    @:native("X86HasADX") static var X86HasADX: Bool;
    @:native("X86HasAES") static var X86HasAES: Bool;
    @:native("X86HasAVX") static var X86HasAVX: Bool;
    @:native("X86HasAVX2") static var X86HasAVX2: Bool;
    @:native("X86HasBMI2") static var X86HasBMI2: Bool;
    @:native("X86HasPCLMULQDQ") static var X86HasPCLMULQDQ: Bool;
    @:native("X86HasSHA") static var X86HasSHA: Bool;
    @:native("X86HasSSE41") static var X86HasSSE41: Bool;
    @:native("X86HasSSSE3") static var X86HasSSSE3: Bool;

}