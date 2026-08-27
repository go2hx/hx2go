package go.os.exec;

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

    @:native("CombinedOutput") function combinedOutput(): (go.Result<go.Slice<go.Byte>>);
    @:native("Environ") function environ(): (go.Slice<String>);
    @:native("Output") function output(): (go.Result<go.Slice<go.Byte>>);
    @:native("Run") function run(): (go.Error);
    @:native("Start") function start(): (go.Error);
    @:native("StderrPipe") function stderrPipe(): (go.Result<go.io.ReadCloser>);
    @:native("StdinPipe") function stdinPipe(): (go.Result<go.io.WriteCloser>);
    @:native("StdoutPipe") function stdoutPipe(): (go.Result<go.io.ReadCloser>);
    @:native("String") function string(): (String);
    @:native("Wait") function wait(): (go.Error);

}