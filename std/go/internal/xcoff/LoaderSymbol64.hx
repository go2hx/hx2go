package go.internal.xcoff;

@:structInit
@:go.Type({ name: "LoaderSymbol64", instanceName: "xcoff.LoaderSymbol64", imports: ["internal/xcoff"] })
extern class LoaderSymbol64 {

    @:native("Lvalue") var lvalue: go.UInt64;
    @:native("Loffset") var loffset: go.UInt32;
    @:native("Lscnum") var lscnum: go.UInt16;
    @:native("Lsmtype") var lsmtype: go.UInt8;
    @:native("Lsmclas") var lsmclas: go.UInt8;
    @:native("Lifile") var lifile: go.UInt32;
    @:native("Lparm") var lparm: go.UInt32;

function new(lvalue: go.UInt64, loffset: go.UInt32, lscnum: go.UInt16, lsmtype: go.UInt8, lsmclas: go.UInt8, lifile: go.UInt32, lparm: go.UInt32);

}