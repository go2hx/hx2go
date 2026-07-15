package go.internal.xcoff;

@:structInit
@:go.Type({ name: "FileHeader64", instanceName: "xcoff.FileHeader64", imports: ["internal/xcoff"] })
extern class FileHeader64 {

    @:native("Fmagic") var fmagic: go.UInt16;
    @:native("Fnscns") var fnscns: go.UInt16;
    @:native("Ftimedat") var ftimedat: go.UInt32;
    @:native("Fsymptr") var fsymptr: go.UInt64;
    @:native("Fopthdr") var fopthdr: go.UInt16;
    @:native("Fflags") var fflags: go.UInt16;
    @:native("Fnsyms") var fnsyms: go.UInt32;

function new(fmagic: go.UInt16, fnscns: go.UInt16, ftimedat: go.UInt32, fsymptr: go.UInt64, fopthdr: go.UInt16, fflags: go.UInt16, fnsyms: go.UInt32);

}