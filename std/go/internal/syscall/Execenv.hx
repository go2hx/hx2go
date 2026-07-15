package go.internal.syscall;

@:go.Type({ name: "execenv", instanceName: "execenv.execenv", imports: ["internal/syscall/execenv"] })
extern class Execenv {

    @:native("Default") static function _default(sys: go.Pointer<go.syscall.SysProcAttr>): go.Result<go.Slice<String>>;

}