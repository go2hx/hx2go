package go.syscall;

@:structInit
@:go.Type({ name: "Statfs_t", instanceName: "syscall.Statfs_t", imports: ["syscall"] })
extern class Statfs_t {

    @:native("Type") var type: go.Int64;
    @:native("Bsize") var bsize: go.Int64;
    @:native("Blocks") var blocks: go.UInt64;
    @:native("Bfree") var bfree: go.UInt64;
    @:native("Bavail") var bavail: go.UInt64;
    @:native("Files") var files: go.UInt64;
    @:native("Ffree") var ffree: go.UInt64;
    @:native("Fsid") var fsid: go.syscall.Fsid;
    @:native("Namelen") var namelen: go.Int64;
    @:native("Frsize") var frsize: go.Int64;
    @:native("Flags") var flags: go.Int64;
    @:native("Spare") var spare: go.GoArray<go.Int64, 4>;

function new(type: go.Int64, bsize: go.Int64, blocks: go.UInt64, bfree: go.UInt64, bavail: go.UInt64, files: go.UInt64, ffree: go.UInt64, fsid: go.syscall.Fsid, namelen: go.Int64, frsize: go.Int64, flags: go.Int64, spare: go.GoArray<go.Int64, 4>);

}