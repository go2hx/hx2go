package go.os.exec;

@:go.TypeAccess({name: "exec.Cmd", imports: ["os/exec"]})
extern class ExecCmd {
    /**
        Runs the command and waits for it to finish. The error is nil if the command runs, has no problems copying stdin, stdout, and stderr, and exits with a zero exit status.

        If the command starts but does not complete successfully, the error is of type *ExitError. Other error types may be returned for other situations.

        If c.Stdin is not an *os.File, Run connects a pipe to the command's standard input and reads from c.Stdin until EOF before closing the pipe. Similarly, if c.Stdout or c.Stderr are not *os.Files, Run connects a pipe to the command's standard output or standard error and writes the command's output to c.Stdout or c.Stderr until EOF.
    **/
   // function run():Error; // TODO this is just a placeholder for now - we need to figure out how to handle the fact that this can return multiple different types of errors in Go, and we don't want to expose all of those directly in Haxe since it would be a bit messy to deal with, but we also need to be able to check for at least some of those error types in Haxe code, so we need to find a way to make that work
}