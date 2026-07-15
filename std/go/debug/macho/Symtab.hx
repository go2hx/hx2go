package go.debug.macho;

@:structInit
@:go.Type({ name: "Symtab", instanceName: "macho.Symtab", imports: ["debug/macho"] })
extern class Symtab {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("SymtabCmd") var symtabCmd: go.debug.macho.SymtabCmd;
    @:native("Syms") var syms: go.Slice<go.debug.macho.Symbol>;

function new(loadBytes: go.debug.macho.LoadBytes, symtabCmd: go.debug.macho.SymtabCmd, syms: go.Slice<go.debug.macho.Symbol>);

    @:native("Raw") function raw(): go.Slice<go.Byte>;

}