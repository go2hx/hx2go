package go.os.exec;

@:go.Type({ name: "exec.Cmd", imports: ["os/exec"] })
extern class ExecCmd {
    // function run():Error; // TODO this is just a placeholder for now - we need to figure out how to handle the fact that this can return multiple different types of errors in Go, and we don't want to expose all of those directly in Haxe since it would be a bit messy to deal with, but we also need to be able to check for at least some of those error types in Haxe code, so we need to find a way to make that work
}