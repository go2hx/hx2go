package go.os.exec;

// TODO implemnt more of os/exec
// https://pkg.go.dev/os/exec
@:go.TypeAccess({name: "exec", imports: ["os/exec"]})
extern class Exec {
	static var ErrNotFound:Error; // ErrNotFound is returned by Command when the binary cannot be found in the system's PATH.

    // TODO use correct types for args and return value - this is just a placeholder for now 
    // static function command(cmd:String, args:...String):Dynamic; // actually returns a *exec.Cmd, but we don't want to expose that directly for now
}
