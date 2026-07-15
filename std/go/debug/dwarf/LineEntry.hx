package go.debug.dwarf;

@:structInit
@:go.Type({ name: "LineEntry", instanceName: "dwarf.LineEntry", imports: ["debug/dwarf"] })
extern class LineEntry {

    @:native("Address") var address: go.UInt64;
    @:native("OpIndex") var opIndex: go.GoInt;
    @:native("File") var file: go.Pointer<go.debug.dwarf.LineFile>;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;
    @:native("IsStmt") var isStmt: Bool;
    @:native("BasicBlock") var basicBlock: Bool;
    @:native("PrologueEnd") var prologueEnd: Bool;
    @:native("EpilogueBegin") var epilogueBegin: Bool;
    @:native("ISA") var ISA: go.GoInt;
    @:native("Discriminator") var discriminator: go.GoInt;
    @:native("EndSequence") var endSequence: Bool;

function new(address: go.UInt64, opIndex: go.GoInt, file: go.Pointer<go.debug.dwarf.LineFile>, line: go.GoInt, column: go.GoInt, isStmt: Bool, basicBlock: Bool, prologueEnd: Bool, epilogueBegin: Bool, ISA: go.GoInt, discriminator: go.GoInt, endSequence: Bool);

}