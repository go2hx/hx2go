package go.debug.plan9obj;

@:structInit
@:go.Type({ name: "prog", instanceName: "plan9obj.prog", imports: ["debug/plan9obj"] })
extern class Prog {

    @:native("Magic") var magic: go.UInt32;
    @:native("Text") var text: go.UInt32;
    @:native("Data") var data: go.UInt32;
    @:native("Bss") var bss: go.UInt32;
    @:native("Syms") var syms: go.UInt32;
    @:native("Entry") var entry: go.UInt32;
    @:native("Spsz") var spsz: go.UInt32;
    @:native("Pcsz") var pcsz: go.UInt32;

    function new(magic: go.UInt32=0, text: go.UInt32=0, data: go.UInt32=0, bss: go.UInt32=0, syms: go.UInt32=0, entry: go.UInt32=0, spsz: go.UInt32=0, pcsz: go.UInt32=0);

}