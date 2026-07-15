package go.debug.macho;

@:structInit
@:go.Type({ name: "SymtabCmd", instanceName: "macho.SymtabCmd", imports: ["debug/macho"] })
extern class SymtabCmd {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Symoff") var symoff: go.UInt32;
    @:native("Nsyms") var nsyms: go.UInt32;
    @:native("Stroff") var stroff: go.UInt32;
    @:native("Strsize") var strsize: go.UInt32;

function new(cmd: go.debug.macho.LoadCmd, len: go.UInt32, symoff: go.UInt32, nsyms: go.UInt32, stroff: go.UInt32, strsize: go.UInt32);

}