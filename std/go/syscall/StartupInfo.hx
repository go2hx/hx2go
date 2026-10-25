package go.syscall;

@:structInit
@:go.Type({ name: "StartupInfo", instanceName: "syscall.StartupInfo", imports: ["syscall"] })
extern class StartupInfo {

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

    function new(cb: go.UInt32=0, desktop: go.Pointer<go.UInt16>=null, title: go.Pointer<go.UInt16>=null, X: go.UInt32=0, Y: go.UInt32=0, xSize: go.UInt32=0, ySize: go.UInt32=0, xCountChars: go.UInt32=0, yCountChars: go.UInt32=0, fillAttribute: go.UInt32=0, flags: go.UInt32=0, showWindow: go.UInt16=0, stdInput: go.syscall.Handle=cast 0, stdOutput: go.syscall.Handle=cast 0, stdErr: go.syscall.Handle=cast 0);

}