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

    function new(cmd: go.debug.macho.LoadCmd=cast 0, len: go.UInt32=0, ilocalsym: go.UInt32=0, nlocalsym: go.UInt32=0, iextdefsym: go.UInt32=0, nextdefsym: go.UInt32=0, iundefsym: go.UInt32=0, nundefsym: go.UInt32=0, tocoffset: go.UInt32=0, ntoc: go.UInt32=0, modtaboff: go.UInt32=0, nmodtab: go.UInt32=0, extrefsymoff: go.UInt32=0, nextrefsyms: go.UInt32=0, indirectsymoff: go.UInt32=0, nindirectsyms: go.UInt32=0, extreloff: go.UInt32=0, nextrel: go.UInt32=0, locreloff: go.UInt32=0, nlocrel: go.UInt32=0);

}