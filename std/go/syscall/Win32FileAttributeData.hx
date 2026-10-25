package go.syscall;

@:structInit
@:go.Type({ name: "Win32FileAttributeData", instanceName: "syscall.Win32FileAttributeData", imports: ["syscall"] })
extern class Win32FileAttributeData {

    @:native("FileAttributes") var fileAttributes: go.UInt32;
    @:native("CreationTime") var creationTime: go.syscall.Filetime;
    @:native("LastAccessTime") var lastAccessTime: go.syscall.Filetime;
    @:native("LastWriteTime") var lastWriteTime: go.syscall.Filetime;
    @:native("FileSizeHigh") var fileSizeHigh: go.UInt32;
    @:native("FileSizeLow") var fileSizeLow: go.UInt32;

    function new(fileAttributes: go.UInt32=0, creationTime: go.syscall.Filetime, lastAccessTime: go.syscall.Filetime, lastWriteTime: go.syscall.Filetime, fileSizeHigh: go.UInt32=0, fileSizeLow: go.UInt32=0);

}