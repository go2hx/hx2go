package go.syscall;

@:structInit
@:go.Type({ name: "Statfs_t", instanceName: "syscall.Statfs_t", imports: ["syscall"] })
extern class Statfs_t {

    @:native("Bsize") var bsize: go.UInt32;
    @:native("Iosize") var iosize: go.Int32;
    @:native("Blocks") var blocks: go.UInt64;
    @:native("Bfree") var bfree: go.UInt64;
    @:native("Bavail") var bavail: go.UInt64;
    @:native("Files") var files: go.UInt64;
    @:native("Ffree") var ffree: go.UInt64;
    @:native("Fsid") var fsid: go.syscall.Fsid;
    @:native("Owner") var owner: go.UInt32;
    @:native("Type") var type: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Fssubtype") var fssubtype: go.UInt32;
    @:native("Fstypename") var fstypename: go.GoArray<go.Int8, 16>;
    @:native("Mntonname") var mntonname: go.GoArray<go.Int8, 1024>;
    @:native("Mntfromname") var mntfromname: go.GoArray<go.Int8, 1024>;
    @:native("Reserved") var reserved: go.GoArray<go.UInt32, 8>;

    function new(bsize: go.UInt32, iosize: go.Int32, blocks: go.UInt64, bfree: go.UInt64, bavail: go.UInt64, files: go.UInt64, ffree: go.UInt64, fsid: go.syscall.Fsid, owner: go.UInt32, type: go.UInt32, flags: go.UInt32, fssubtype: go.UInt32, fstypename: go.GoArray<go.Int8, 16>, mntonname: go.GoArray<go.Int8, 1024>, mntfromname: go.GoArray<go.Int8, 1024>, reserved: go.GoArray<go.UInt32, 8>);

}