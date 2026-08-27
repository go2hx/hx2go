package go.debug.macho;

@:structInit
@:go.Type({ name: "Symtab", instanceName: "macho.Symtab", imports: ["debug/macho"] })
extern class Symtab {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("SymtabCmd") var symtabCmd: go.debug.macho.SymtabCmd;
    @:native("Syms") var syms: go.Slice<go.debug.macho.Symbol>;
    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Symoff") var symoff: go.UInt32;
    @:native("Nsyms") var nsyms: go.UInt32;
    @:native("Stroff") var stroff: go.UInt32;
    @:native("Strsize") var strsize: go.UInt32;

    function new(loadBytes: go.debug.macho.LoadBytes=null, symtabCmd: go.debug.macho.SymtabCmd, syms: go.Slice<go.debug.macho.Symbol>=null);

    @:native("Raw") function raw(): (go.Slice<go.Byte>);

}