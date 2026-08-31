package go.os.exec;

/**
    Cmd represents an external command being prepared or run.
    
    A Cmd cannot be reused after calling its [Cmd.Start], [Cmd.Run],
    [Cmd.Output], or [Cmd.CombinedOutput] methods.
**/
@:structInit
@:go.Type({ name: "Cmd", instanceName: "exec.Cmd", imports: ["os/exec"] })
extern class Cmd {

    @:native("Path") var path: String;
    @:native("Args") var args: go.Slice<String>;
    @:native("Env") var env: go.Slice<String>;
    @:native("Dir") var dir: String;
    @:native("Stdin") var stdin: go.io.Reader;
    @:native("Stdout") var stdout: go.io.Writer;
    @:native("Stderr") var stderr: go.io.Writer;
    @:native("ExtraFiles") var extraFiles: go.Slice<go.Pointer<go.os.File>>;
    @:native("SysProcAttr") var sysProcAttr: go.Pointer<go.syscall.SysProcAttr>;
    @:native("Process") var process: go.Pointer<go.os.Process>;
    @:native("ProcessState") var processState: go.Pointer<go.os.ProcessState>;
    @:native("Err") var err: go.Error;
    @:native("Cancel") var cancel: () -> (go.Error);
    @:native("WaitDelay") var waitDelay: go.time.Duration;

    function new(path: String="", args: go.Slice<String>=null, env: go.Slice<String>=null, dir: String="", stdin: go.io.Reader=null, stdout: go.io.Writer=null, stderr: go.io.Writer=null, extraFiles: go.Slice<go.Pointer<go.os.File>>=null, sysProcAttr: go.Pointer<go.syscall.SysProcAttr>=null, process: go.Pointer<go.os.Process>=null, processState: go.Pointer<go.os.ProcessState>=null, err: go.Error=null, cancel: () -> (go.Error)=null, waitDelay: go.time.Duration=cast 0);

    /**
        CombinedOutput runs the command and returns its combined standard
        output and standard error.
    **/
    @:native("CombinedOutput") function combinedOutput(): (go.Result<go.Slice<go.Byte>>);
    /**
        Environ returns a copy of the environment in which the command would be run
        as it is currently configured.
    **/
    @:native("Environ") function environ(): (go.Slice<String>);
    /**
        Output runs the command and returns its standard output.
        Any returned error will usually be of type [*ExitError].
        If c.Stderr was nil and the returned error is of type
        [*ExitError], Output populates the Stderr field of the
        returned error.
    **/
    @:native("Output") function output(): (go.Result<go.Slice<go.Byte>>);
    /**
        Run starts the specified command and waits for it to complete.
        
        The returned error is nil if the command runs, has no problems
        copying stdin, stdout, and stderr, and exits with a zero exit
        status.
        
        If the command starts but does not complete successfully, the error is of
        type [*ExitError]. Other error types may be returned for other situations.
        
        If the calling goroutine has locked the operating system thread
        with [runtime.LockOSThread] and modified any inheritable OS-level
        thread state (for example, Linux or Plan 9 name spaces), the new
        process will inherit the caller's thread state.
    **/
    @:native("Run") function run(): (go.Error);
    /**
        Start starts the specified command but does not wait for it to complete.
        
        If Start returns successfully, the c.Process field will be set.
        
        After a successful call to Start the [Cmd.Wait] method must be called in
        order to release associated system resources.
    **/
    @:native("Start") function start(): (go.Error);
    /**
        StderrPipe returns a pipe that will be connected to the command's
        standard error when the command starts.
        
        [Cmd.Wait] will close the pipe after seeing the command exit, so most callers
        need not close the pipe themselves. It is thus incorrect to call Wait
        before all reads from the pipe have completed.
        For the same reason, it is incorrect to use [Cmd.Run] when using StderrPipe.
        See the StdoutPipe example for idiomatic usage.
    **/
    @:native("StderrPipe") function stderrPipe(): (go.Result<go.io.ReadCloser>);
    /**
        StdinPipe returns a pipe that will be connected to the command's
        standard input when the command starts.
        The pipe will be closed automatically after [Cmd.Wait] sees the command exit.
        A caller need only call Close to force the pipe to close sooner.
        For example, if the command being run will not exit until standard input
        is closed, the caller must close the pipe.
    **/
    @:native("StdinPipe") function stdinPipe(): (go.Result<go.io.WriteCloser>);
    /**
        StdoutPipe returns a pipe that will be connected to the command's
        standard output when the command starts.
        
        [Cmd.Wait] will close the pipe after seeing the command exit, so most callers
        need not close the pipe themselves. It is thus incorrect to call Wait
        before all reads from the pipe have completed.
        For the same reason, it is incorrect to call [Cmd.Run] when using StdoutPipe.
        See the example for idiomatic usage.
    **/
    @:native("StdoutPipe") function stdoutPipe(): (go.Result<go.io.ReadCloser>);
    /**
        String returns a human-readable description of c.
        It is intended only for debugging.
        In particular, it is not suitable for use as input to a shell.
        The output of String may vary across Go releases.
    **/
    @:native("String") function string(): (String);
    /**
        Wait waits for the command to exit and waits for any copying to
        stdin or copying from stdout or stderr to complete.
        
        The command must have been started by [Cmd.Start].
        
        The returned error is nil if the command runs, has no problems
        copying stdin, stdout, and stderr, and exits with a zero exit
        status.
        
        If the command fails to run or doesn't complete successfully, the
        error is of type [*ExitError]. Other error types may be
        returned for I/O problems.
        
        If any of c.Stdin, c.Stdout or c.Stderr are not an [*os.File], Wait also waits
        for the respective I/O loop copying to or from the process to complete.
        
        Wait releases any resources associated with the [Cmd].
    **/
    @:native("Wait") function wait(): (go.Error);

}