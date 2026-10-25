package go.syscall;

@:structInit
@:go.Type({ name: "SysProcAttr", instanceName: "syscall.SysProcAttr", imports: ["syscall"] })
extern class SysProcAttr {

    @:native("HideWindow") var hideWindow: Bool;
    @:native("CmdLine") var cmdLine: String;
    @:native("CreationFlags") var creationFlags: go.UInt32;
    @:native("Token") var token: go.syscall.Token;
    @:native("ProcessAttributes") var processAttributes: go.Pointer<go.syscall.SecurityAttributes>;
    @:native("ThreadAttributes") var threadAttributes: go.Pointer<go.syscall.SecurityAttributes>;
    @:native("NoInheritHandles") var noInheritHandles: Bool;
    @:native("AdditionalInheritedHandles") var additionalInheritedHandles: go.Slice<go.syscall.Handle>;
    @:native("ParentProcess") var parentProcess: go.syscall.Handle;

    function new(hideWindow: Bool=false, cmdLine: String="", creationFlags: go.UInt32=0, token: go.syscall.Token=cast 0, processAttributes: go.Pointer<go.syscall.SecurityAttributes>=null, threadAttributes: go.Pointer<go.syscall.SecurityAttributes>=null, noInheritHandles: Bool=false, additionalInheritedHandles: go.Slice<go.syscall.Handle>=null, parentProcess: go.syscall.Handle=cast 0);

}