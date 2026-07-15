package go.debug.elf;

@:structInit
@:go.Type({ name: "ImportedSymbol", instanceName: "elf.ImportedSymbol", imports: ["debug/elf"] })
extern class ImportedSymbol {

    @:native("Name") var name: String;
    @:native("Version") var version: String;
    @:native("Library") var library: String;

function new(name: String, version: String, library: String);

}