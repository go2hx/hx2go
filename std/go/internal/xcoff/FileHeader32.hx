package go.internal.xcoff;

@:structInit
@:go.Type({ name: "FileHeader32", instanceName: "xcoff.FileHeader32", imports: ["internal/xcoff"] })
extern class FileHeader32 {

    @:native("Fmagic") var fmagic: go.UInt16;
    @:native("Fnscns") var fnscns: go.UInt16;
    @:native("Ftimedat") var ftimedat: go.UInt32;
    @:native("Fsymptr") var fsymptr: go.UInt32;
    @:native("Fnsyms") var fnsyms: go.UInt32;
    @:native("Fopthdr") var fopthdr: go.UInt16;
    @:native("Fflags") var fflags: go.UInt16;

function new(fmagic: go.UInt16, fnscns: go.UInt16, ftimedat: go.UInt32, fsymptr: go.UInt32, fnsyms: go.UInt32, fopthdr: go.UInt16, fflags: go.UInt16);

}