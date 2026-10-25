package go.syscall;

@:structInit
@:go.Type({ name: "FileNotifyInformation", instanceName: "syscall.FileNotifyInformation", imports: ["syscall"] })
extern class FileNotifyInformation {

    @:native("NextEntryOffset") var nextEntryOffset: go.UInt32;
    @:native("Action") var action: go.UInt32;
    @:native("FileNameLength") var fileNameLength: go.UInt32;
    @:native("FileName") var fileName: go.UInt16;

    function new(nextEntryOffset: go.UInt32=0, action: go.UInt32=0, fileNameLength: go.UInt32=0, fileName: go.UInt16=0);

}