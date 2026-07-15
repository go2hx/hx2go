package go.debug.macho;

@:structInit
@:go.Type({ name: "Dysymtab", instanceName: "macho.Dysymtab", imports: ["debug/macho"] })
extern class Dysymtab {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("DysymtabCmd") var dysymtabCmd: go.debug.macho.DysymtabCmd;
    @:native("IndirectSyms") var indirectSyms: go.Slice<go.UInt32>;

function new(loadBytes: go.debug.macho.LoadBytes, dysymtabCmd: go.debug.macho.DysymtabCmd, indirectSyms: go.Slice<go.UInt32>);

    @:native("Raw") function raw(): go.Slice<go.Byte>;

}