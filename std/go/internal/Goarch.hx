package go.internal;

@:go.Type({ name: "goarch", instanceName: "goarch.goarch", imports: ["internal/goarch"] })
extern class Goarch {

    @:native("AMD64") static var AMD64: go.internal.goarch.ArchFamilyType;
    @:native("ARM") static var ARM: go.internal.goarch.ArchFamilyType;
    @:native("ARM64") static var ARM64: go.internal.goarch.ArchFamilyType;
    @:native("ArchFamily") static var ArchFamily: go.internal.goarch.ArchFamilyType;
    @:native("BigEndian") static var BigEndian: Bool;
    @:native("DefaultPhysPageSize") static var DefaultPhysPageSize: go.GoInt;
    @:native("GOARCH") static var GOARCH: String;
    @:native("I386") static var I386: go.internal.goarch.ArchFamilyType;
    @:native("Int64Align") static var Int64Align: go.GoInt;
    @:native("Is386") static var Is386: go.GoInt;
    @:native("IsAmd64") static var IsAmd64: go.GoInt;
    @:native("IsAmd64p32") static var IsAmd64p32: go.GoInt;
    @:native("IsArm") static var IsArm: go.GoInt;
    @:native("IsArm64") static var IsArm64: go.GoInt;
    @:native("IsArm64be") static var IsArm64be: go.GoInt;
    @:native("IsArmbe") static var IsArmbe: go.GoInt;
    @:native("IsLoong64") static var IsLoong64: go.GoInt;
    @:native("IsMips") static var IsMips: go.GoInt;
    @:native("IsMips64") static var IsMips64: go.GoInt;
    @:native("IsMips64le") static var IsMips64le: go.GoInt;
    @:native("IsMips64p32") static var IsMips64p32: go.GoInt;
    @:native("IsMips64p32le") static var IsMips64p32le: go.GoInt;
    @:native("IsMipsle") static var IsMipsle: go.GoInt;
    @:native("IsPpc") static var IsPpc: go.GoInt;
    @:native("IsPpc64") static var IsPpc64: go.GoInt;
    @:native("IsPpc64le") static var IsPpc64le: go.GoInt;
    @:native("IsRiscv") static var IsRiscv: go.GoInt;
    @:native("IsRiscv64") static var IsRiscv64: go.GoInt;
    @:native("IsS390") static var IsS390: go.GoInt;
    @:native("IsS390x") static var IsS390x: go.GoInt;
    @:native("IsSparc") static var IsSparc: go.GoInt;
    @:native("IsSparc64") static var IsSparc64: go.GoInt;
    @:native("IsWasm") static var IsWasm: go.GoInt;
    @:native("LOONG64") static var LOONG64: go.internal.goarch.ArchFamilyType;
    @:native("MIPS") static var MIPS: go.internal.goarch.ArchFamilyType;
    @:native("MIPS64") static var MIPS64: go.internal.goarch.ArchFamilyType;
    @:native("MinFrameSize") static var MinFrameSize: go.GoInt;
    @:native("PCQuantum") static var PCQuantum: go.GoInt;
    @:native("PPC64") static var PPC64: go.internal.goarch.ArchFamilyType;
    @:native("PtrBits") static var PtrBits: go.GoInt;
    @:native("PtrSize") static var PtrSize: go.GoInt;
    @:native("RISCV64") static var RISCV64: go.internal.goarch.ArchFamilyType;
    @:native("S390X") static var S390X: go.internal.goarch.ArchFamilyType;
    @:native("StackAlign") static var StackAlign: go.GoInt;
    @:native("WASM") static var WASM: go.internal.goarch.ArchFamilyType;

}