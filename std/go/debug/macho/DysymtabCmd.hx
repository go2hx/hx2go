package go.debug.macho;

@:structInit
@:go.Type({ name: "DysymtabCmd", instanceName: "macho.DysymtabCmd", imports: ["debug/macho"] })
extern class DysymtabCmd {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Ilocalsym") var ilocalsym: go.UInt32;
    @:native("Nlocalsym") var nlocalsym: go.UInt32;
    @:native("Iextdefsym") var iextdefsym: go.UInt32;
    @:native("Nextdefsym") var nextdefsym: go.UInt32;
    @:native("Iundefsym") var iundefsym: go.UInt32;
    @:native("Nundefsym") var nundefsym: go.UInt32;
    @:native("Tocoffset") var tocoffset: go.UInt32;
    @:native("Ntoc") var ntoc: go.UInt32;
    @:native("Modtaboff") var modtaboff: go.UInt32;
    @:native("Nmodtab") var nmodtab: go.UInt32;
    @:native("Extrefsymoff") var extrefsymoff: go.UInt32;
    @:native("Nextrefsyms") var nextrefsyms: go.UInt32;
    @:native("Indirectsymoff") var indirectsymoff: go.UInt32;
    @:native("Nindirectsyms") var nindirectsyms: go.UInt32;
    @:native("Extreloff") var extreloff: go.UInt32;
    @:native("Nextrel") var nextrel: go.UInt32;
    @:native("Locreloff") var locreloff: go.UInt32;
    @:native("Nlocrel") var nlocrel: go.UInt32;

function new(cmd: go.debug.macho.LoadCmd, len: go.UInt32, ilocalsym: go.UInt32, nlocalsym: go.UInt32, iextdefsym: go.UInt32, nextdefsym: go.UInt32, iundefsym: go.UInt32, nundefsym: go.UInt32, tocoffset: go.UInt32, ntoc: go.UInt32, modtaboff: go.UInt32, nmodtab: go.UInt32, extrefsymoff: go.UInt32, nextrefsyms: go.UInt32, indirectsymoff: go.UInt32, nindirectsyms: go.UInt32, extreloff: go.UInt32, nextrel: go.UInt32, locreloff: go.UInt32, nlocrel: go.UInt32);

}