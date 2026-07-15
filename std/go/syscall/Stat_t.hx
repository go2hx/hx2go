package go.syscall;

@:structInit
@:go.Type({ name: "Stat_t", instanceName: "syscall.Stat_t", imports: ["syscall"] })
extern class Stat_t {

    @:native("Dev") var dev: go.UInt64;
    @:native("Ino") var ino: go.UInt64;
    @:native("Nlink") var nlink: go.UInt64;
    @:native("Mode") var mode: go.UInt32;
    @:native("Uid") var uid: go.UInt32;
    @:native("Gid") var gid: go.UInt32;
    @:native("X__pad0") var x__pad0: go.Int32;
    @:native("Rdev") var rdev: go.UInt64;
    @:native("Size") var size: go.Int64;
    @:native("Blksize") var blksize: go.Int64;
    @:native("Blocks") var blocks: go.Int64;
    @:native("Atim") var atim: go.syscall.Timespec;
    @:native("Mtim") var mtim: go.syscall.Timespec;
    @:native("Ctim") var ctim: go.syscall.Timespec;
    @:native("X__unused") var x__unused: go.GoArray<go.Int64, 3>;

function new(dev: go.UInt64, ino: go.UInt64, nlink: go.UInt64, mode: go.UInt32, uid: go.UInt32, gid: go.UInt32, x__pad0: go.Int32, rdev: go.UInt64, size: go.Int64, blksize: go.Int64, blocks: go.Int64, atim: go.syscall.Timespec, mtim: go.syscall.Timespec, ctim: go.syscall.Timespec, x__unused: go.GoArray<go.Int64, 3>);

}