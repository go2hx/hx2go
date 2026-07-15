package go.internal.xcoff;

@:structInit
@:go.Type({ name: "LoaderHeader32", instanceName: "xcoff.LoaderHeader32", imports: ["internal/xcoff"] })
extern class LoaderHeader32 {

    @:native("Lversion") var lversion: go.UInt32;
    @:native("Lnsyms") var lnsyms: go.UInt32;
    @:native("Lnreloc") var lnreloc: go.UInt32;
    @:native("Listlen") var listlen: go.UInt32;
    @:native("Lnimpid") var lnimpid: go.UInt32;
    @:native("Limpoff") var limpoff: go.UInt32;
    @:native("Lstlen") var lstlen: go.UInt32;
    @:native("Lstoff") var lstoff: go.UInt32;

function new(lversion: go.UInt32, lnsyms: go.UInt32, lnreloc: go.UInt32, listlen: go.UInt32, lnimpid: go.UInt32, limpoff: go.UInt32, lstlen: go.UInt32, lstoff: go.UInt32);

}