package go.syscall;

@:structInit
@:go.Type({ name: "mountPointReparseBuffer", instanceName: "syscall.mountPointReparseBuffer", imports: ["syscall"] })
extern class MountPointReparseBuffer {

    @:native("SubstituteNameOffset") var substituteNameOffset: go.UInt16;
    @:native("SubstituteNameLength") var substituteNameLength: go.UInt16;
    @:native("PrintNameOffset") var printNameOffset: go.UInt16;
    @:native("PrintNameLength") var printNameLength: go.UInt16;
    @:native("PathBuffer") var pathBuffer: go.GoArray<go.UInt16, 1>;

    function new(substituteNameOffset: go.UInt16=0, substituteNameLength: go.UInt16=0, printNameOffset: go.UInt16=0, printNameLength: go.UInt16=0, pathBuffer: go.GoArray<go.UInt16, 1>);

}