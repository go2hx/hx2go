package go.os.exec;


// TODO implemnt more of os/exec
// https://pkg.go.dev/os/exec
@:go.TypeAccess({name: "os/exec", imports: ["os/exec"]})
extern class Exec {
	static function command(cmd:String, ?args:Array<String>): ExecCmd; // actually returns a *exec.Cmd, but we don't want to expose that directly for now
}

