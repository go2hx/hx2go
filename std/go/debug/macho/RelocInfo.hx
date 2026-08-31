package go.debug.macho;

@:structInit
@:go.Type({ name: "relocInfo", instanceName: "macho.relocInfo", imports: ["debug/macho"] })
extern class RelocInfo {

    @:native("Addr") var addr: go.UInt32;
    @:native("Symnum") var symnum: go.UInt32;

    function new(addr: go.UInt32=0, symnum: go.UInt32=0);

}