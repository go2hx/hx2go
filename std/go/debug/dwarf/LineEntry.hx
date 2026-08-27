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

    function new(address: go.UInt64=0, opIndex: go.GoInt=0, file: go.Pointer<go.debug.dwarf.LineFile>=null, line: go.GoInt=0, column: go.GoInt=0, isStmt: Bool=false, basicBlock: Bool=false, prologueEnd: Bool=false, epilogueBegin: Bool=false, ISA: go.GoInt=0, discriminator: go.GoInt=0, endSequence: Bool=false);

}