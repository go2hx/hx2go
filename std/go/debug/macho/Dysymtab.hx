package go.debug.macho;

@:structInit
@:go.Type({ name: "Dysymtab", instanceName: "macho.Dysymtab", imports: ["debug/macho"] })
extern class Dysymtab {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("DysymtabCmd") var dysymtabCmd: go.debug.macho.DysymtabCmd;
    @:native("IndirectSyms") var indirectSyms: go.Slice<go.UInt32>;
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

    function new(loadBytes: go.debug.macho.LoadBytes=null, dysymtabCmd: go.debug.macho.DysymtabCmd, indirectSyms: go.Slice<go.UInt32>=null);

    @:native("Raw") function raw(): (go.Slice<go.Byte>);

}