package go.syscall;

@:structInit
@:go.Type({ name: "ProcessEntry32", instanceName: "syscall.ProcessEntry32", imports: ["syscall"] })
extern class ProcessEntry32 {

    @:native("Size") var size: go.UInt32;
    @:native("Usage") var usage: go.UInt32;
    @:native("ProcessID") var processID: go.UInt32;
    @:native("DefaultHeapID") var defaultHeapID: go.UIntPtr;
    @:native("ModuleID") var moduleID: go.UInt32;
    @:native("Threads") var threads: go.UInt32;
    @:native("ParentProcessID") var parentProcessID: go.UInt32;
    @:native("PriClassBase") var priClassBase: go.Int32;
    @:native("Flags") var flags: go.UInt32;
    @:native("ExeFile") var exeFile: go.GoArray<go.UInt16, 260>;

    function new(size: go.UInt32=0, usage: go.UInt32=0, processID: go.UInt32=0, defaultHeapID: go.UIntPtr=0, moduleID: go.UInt32=0, threads: go.UInt32=0, parentProcessID: go.UInt32=0, priClassBase: go.Int32=0, flags: go.UInt32=0, exeFile: go.GoArray<go.UInt16, 260>);

}