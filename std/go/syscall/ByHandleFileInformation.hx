package go.syscall;

@:structInit
@:go.Type({ name: "ByHandleFileInformation", instanceName: "syscall.ByHandleFileInformation", imports: ["syscall"] })
extern class ByHandleFileInformation {

    @:native("FileAttributes") var fileAttributes: go.UInt32;
    @:native("CreationTime") var creationTime: go.syscall.Filetime;
    @:native("LastAccessTime") var lastAccessTime: go.syscall.Filetime;
    @:native("LastWriteTime") var lastWriteTime: go.syscall.Filetime;
    @:native("VolumeSerialNumber") var volumeSerialNumber: go.UInt32;
    @:native("FileSizeHigh") var fileSizeHigh: go.UInt32;
    @:native("FileSizeLow") var fileSizeLow: go.UInt32;
    @:native("NumberOfLinks") var numberOfLinks: go.UInt32;
    @:native("FileIndexHigh") var fileIndexHigh: go.UInt32;
    @:native("FileIndexLow") var fileIndexLow: go.UInt32;

    function new(fileAttributes: go.UInt32=0, creationTime: go.syscall.Filetime, lastAccessTime: go.syscall.Filetime, lastWriteTime: go.syscall.Filetime, volumeSerialNumber: go.UInt32=0, fileSizeHigh: go.UInt32=0, fileSizeLow: go.UInt32=0, numberOfLinks: go.UInt32=0, fileIndexHigh: go.UInt32=0, fileIndexLow: go.UInt32=0);

}