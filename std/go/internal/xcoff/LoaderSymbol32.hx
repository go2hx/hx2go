package go.internal.xcoff;

@:structInit
@:go.Type({ name: "LoaderSymbol32", instanceName: "xcoff.LoaderSymbol32", imports: ["internal/xcoff"] })
extern class LoaderSymbol32 {

    @:native("Lname") var lname: go.GoArray<go.Byte, 8>;
    @:native("Lvalue") var lvalue: go.UInt32;
    @:native("Lscnum") var lscnum: go.UInt16;
    @:native("Lsmtype") var lsmtype: go.UInt8;
    @:native("Lsmclas") var lsmclas: go.UInt8;
    @:native("Lifile") var lifile: go.UInt32;
    @:native("Lparm") var lparm: go.UInt32;

function new(lname: go.GoArray<go.Byte, 8>, lvalue: go.UInt32, lscnum: go.UInt16, lsmtype: go.UInt8, lsmclas: go.UInt8, lifile: go.UInt32, lparm: go.UInt32);

}