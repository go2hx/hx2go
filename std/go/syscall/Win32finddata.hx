package go.syscall;

@:structInit
@:go.Type({ name: "Win32finddata", instanceName: "syscall.Win32finddata", imports: ["syscall"] })
extern class Win32finddata {

    @:native("FileAttributes") var fileAttributes: go.UInt32;
    @:native("CreationTime") var creationTime: go.syscall.Filetime;
    @:native("LastAccessTime") var lastAccessTime: go.syscall.Filetime;
    @:native("LastWriteTime") var lastWriteTime: go.syscall.Filetime;
    @:native("FileSizeHigh") var fileSizeHigh: go.UInt32;
    @:native("FileSizeLow") var fileSizeLow: go.UInt32;
    @:native("Reserved0") var reserved0: go.UInt32;
    @:native("Reserved1") var reserved1: go.UInt32;
    @:native("FileName") var fileName: go.GoArray<go.UInt16, 259>;
    @:native("AlternateFileName") var alternateFileName: go.GoArray<go.UInt16, 13>;

    function new(fileAttributes: go.UInt32=0, creationTime: go.syscall.Filetime, lastAccessTime: go.syscall.Filetime, lastWriteTime: go.syscall.Filetime, fileSizeHigh: go.UInt32=0, fileSizeLow: go.UInt32=0, reserved0: go.UInt32=0, reserved1: go.UInt32=0, fileName: go.GoArray<go.UInt16, 259>, alternateFileName: go.GoArray<go.UInt16, 13>);

}