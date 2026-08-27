package go.syscall;

@:structInit
@:go.Type({ name: "ProcAttr", instanceName: "syscall.ProcAttr", imports: ["syscall"] })
extern class ProcAttr {

    @:native("Dir") var dir: String;
    @:native("Env") var env: go.Slice<String>;
    @:native("Files") var files: go.Slice<go.UIntPtr>;
    @:native("Sys") var sys: go.Pointer<go.syscall.SysProcAttr>;

    function new(dir: String="", env: go.Slice<String>=null, files: go.Slice<go.UIntPtr>=null, sys: go.Pointer<go.syscall.SysProcAttr>=null);

}