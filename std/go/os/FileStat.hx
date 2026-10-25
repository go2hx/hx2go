package go.os;

@:structInit
@:go.Type({ name: "fileStat", instanceName: "os.fileStat", imports: ["os"] })
extern class FileStat {

    @:native("FileAttributes") var fileAttributes: go.UInt32;
    @:native("CreationTime") var creationTime: go.syscall.Filetime;
    @:native("LastAccessTime") var lastAccessTime: go.syscall.Filetime;
    @:native("LastWriteTime") var lastWriteTime: go.syscall.Filetime;
    @:native("FileSizeHigh") var fileSizeHigh: go.UInt32;
    @:native("FileSizeLow") var fileSizeLow: go.UInt32;
    @:native("ReparseTag") var reparseTag: go.UInt32;
    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(fileAttributes: go.UInt32=0, creationTime: go.syscall.Filetime, lastAccessTime: go.syscall.Filetime, lastWriteTime: go.syscall.Filetime, fileSizeHigh: go.UInt32=0, fileSizeLow: go.UInt32=0, reparseTag: go.UInt32=0, mutex: go.sync.Mutex);

    @:native("IsDir") function isDir(): (Bool);
    @:native("Lock") function lock(): Void;
    @:native("ModTime") function modTime(): (go.time.Time);
    @:native("Mode") function mode(): (go.os.FileMode);
    @:native("Name") function name(): (String);
    @:native("Size") function size(): (go.Int64);
    @:native("Sys") function sys(): (Dynamic);
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}