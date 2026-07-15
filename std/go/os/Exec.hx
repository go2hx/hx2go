package go.os;

@:go.Type({ name: "exec", instanceName: "exec.exec", imports: ["os/exec"] })
extern class Exec {

    @:native("Command") static function command(name: String, arg: haxe.Rest<String>): go.Pointer<go.os.exec.Cmd>;
    @:native("CommandContext") static function commandContext(ctx: go.context.Context, name: String, arg: haxe.Rest<String>): go.Pointer<go.os.exec.Cmd>;
    @:native("LookPath") static function lookPath(file: String): go.Result<String>;

}