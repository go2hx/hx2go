package go.os.exec;

@:go.TypeAccess({name: "*Cmd", imports: ["os/exec"]})
extern class ExecCmd {
    /**
        Runs the command and waits for it to finish. The error is nil if the command runs, has no problems copying stdin, stdout, and stderr, and exits with a zero exit status.

        If the command starts but does not complete successfully, the error is of type *ExitError. Other error types may be returned for other situations.

        If c.Stdin is not an *os.File, Run connects a pipe to the command's standard input and reads from c.Stdin until EOF before closing the pipe. Similarly, if c.Stdout or c.Stderr are not *os.Files, Run connects a pipe to the command's standard output or standard error and writes the command's output to c.Stdout or c.Stderr until EOF.
    **/
    function run():Error;
}