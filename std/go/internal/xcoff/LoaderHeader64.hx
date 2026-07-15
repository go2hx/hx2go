package go.internal.xcoff;

@:structInit
@:go.Type({ name: "LoaderHeader64", instanceName: "xcoff.LoaderHeader64", imports: ["internal/xcoff"] })
extern class LoaderHeader64 {

    @:native("Lversion") var lversion: go.UInt32;
    @:native("Lnsyms") var lnsyms: go.UInt32;
    @:native("Lnreloc") var lnreloc: go.UInt32;
    @:native("Listlen") var listlen: go.UInt32;
    @:native("Lnimpid") var lnimpid: go.UInt32;
    @:native("Lstlen") var lstlen: go.UInt32;
    @:native("Limpoff") var limpoff: go.UInt64;
    @:native("Lstoff") var lstoff: go.UInt64;
    @:native("Lsymoff") var lsymoff: go.UInt64;
    @:native("Lrldoff") var lrldoff: go.UInt64;

function new(lversion: go.UInt32, lnsyms: go.UInt32, lnreloc: go.UInt32, listlen: go.UInt32, lnimpid: go.UInt32, lstlen: go.UInt32, limpoff: go.UInt64, lstoff: go.UInt64, lsymoff: go.UInt64, lrldoff: go.UInt64);

}