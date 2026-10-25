package go.syscall;

@:structInit
@:go.Type({ name: "_STARTUPINFOEXW", instanceName: "syscall._STARTUPINFOEXW", imports: ["syscall"] })
extern class T_STARTUPINFOEXW {

    @:native("StartupInfo") var startupInfo: go.syscall.StartupInfo;
    @:native("ProcThreadAttributeList") var procThreadAttributeList: go.Pointer<go.syscall.T_PROC_THREAD_ATTRIBUTE_LIST>;
    @:native("Cb") var cb: go.UInt32;
    @:native("Desktop") var desktop: go.Pointer<go.UInt16>;
    @:native("Title") var title: go.Pointer<go.UInt16>;
    @:native("X") var X: go.UInt32;
    @:native("Y") var Y: go.UInt32;
    @:native("XSize") var xSize: go.UInt32;
    @:native("YSize") var ySize: go.UInt32;
    @:native("XCountChars") var xCountChars: go.UInt32;
    @:native("YCountChars") var yCountChars: go.UInt32;
    @:native("FillAttribute") var fillAttribute: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("ShowWindow") var showWindow: go.UInt16;
    @:native("StdInput") var stdInput: go.syscall.Handle;
    @:native("StdOutput") var stdOutput: go.syscall.Handle;
    @:native("StdErr") var stdErr: go.syscall.Handle;

    function new(startupInfo: go.syscall.StartupInfo, procThreadAttributeList: go.Pointer<go.syscall.T_PROC_THREAD_ATTRIBUTE_LIST>=null);

}