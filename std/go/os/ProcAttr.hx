package go.os;

@:structInit
@:go.Type({ name: "ProcAttr", instanceName: "os.ProcAttr", imports: ["os"] })
extern class ProcAttr {

    @:native("Dir") var dir: String;
    @:native("Env") var env: go.Slice<String>;
    @:native("Files") var files: go.Slice<go.Pointer<go.os.File>>;
    @:native("Sys") var sys: go.Pointer<go.syscall.SysProcAttr>;

    function new(dir: String, env: go.Slice<String>, files: go.Slice<go.Pointer<go.os.File>>, sys: go.Pointer<go.syscall.SysProcAttr>);

}