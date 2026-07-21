package go.syscall;

@:structInit
@:go.Type({ name: "Stat_t", instanceName: "syscall.Stat_t", imports: ["syscall"] })
extern class Stat_t {

    @:native("Dev") var dev: go.Int32;
    @:native("Mode") var mode: go.UInt16;
    @:native("Nlink") var nlink: go.UInt16;
    @:native("Ino") var ino: go.UInt64;
    @:native("Uid") var uid: go.UInt32;
    @:native("Gid") var gid: go.UInt32;
    @:native("Rdev") var rdev: go.Int32;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Atimespec") var atimespec: go.syscall.Timespec;
    @:native("Mtimespec") var mtimespec: go.syscall.Timespec;
    @:native("Ctimespec") var ctimespec: go.syscall.Timespec;
    @:native("Birthtimespec") var birthtimespec: go.syscall.Timespec;
    @:native("Size") var size: go.Int64;
    @:native("Blocks") var blocks: go.Int64;
    @:native("Blksize") var blksize: go.Int32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Gen") var gen: go.UInt32;
    @:native("Lspare") var lspare: go.Int32;
    @:native("Qspare") var qspare: go.GoArray<go.Int64, 2>;

    function new(dev: go.Int32, mode: go.UInt16, nlink: go.UInt16, ino: go.UInt64, uid: go.UInt32, gid: go.UInt32, rdev: go.Int32, pad_cgo_0: go.GoArray<go.Byte, 4>, atimespec: go.syscall.Timespec, mtimespec: go.syscall.Timespec, ctimespec: go.syscall.Timespec, birthtimespec: go.syscall.Timespec, size: go.Int64, blocks: go.Int64, blksize: go.Int32, flags: go.UInt32, gen: go.UInt32, lspare: go.Int32, qspare: go.GoArray<go.Int64, 2>);

}