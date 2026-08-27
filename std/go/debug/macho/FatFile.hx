package go.debug.macho;

@:structInit
@:go.Type({ name: "FatFile", instanceName: "macho.FatFile", imports: ["debug/macho"] })
extern class FatFile {

    @:native("Magic") var magic: go.UInt32;
    @:native("Arches") var arches: go.Slice<go.debug.macho.FatArch>;

    function new(magic: go.UInt32=0, arches: go.Slice<go.debug.macho.FatArch>=null);

    @:native("Close") function close(): (go.Error);

}