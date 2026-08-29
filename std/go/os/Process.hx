package go.os;

/**
    Process stores the information about a process created by [StartProcess].
**/
@:structInit
@:go.Type({ name: "Process", instanceName: "os.Process", imports: ["os"] })
extern class Process {

    @:native("Pid") var pid: go.GoInt;

    function new(pid: go.GoInt=0);

    /**
        Kill causes the [Process] to exit immediately. Kill does not wait until
        the Process has actually exited. This only kills the Process itself,
        not any other processes it may have started.
    **/
    @:native("Kill") function kill(): (go.Error);
    /**
        Release releases any resources associated with the [Process] p,
        rendering it unusable in the future.
        Release only needs to be called if [Process.Wait] is not.
    **/
    @:native("Release") function release(): (go.Error);
    /**
        Signal sends a signal to the [Process].
        Sending [Interrupt] on Windows is not implemented.
    **/
    @:native("Signal") function signal(sig: go.os.Signal): (go.Error);
    /**
        Wait waits for the [Process] to exit, and then returns a
        ProcessState describing its status and an error, if any.
        Wait releases any resources associated with the Process.
        On most operating systems, the Process must be a child
        of the current process or an error will be returned.
    **/
    @:native("Wait") function wait(): (go.Result<go.Pointer<go.os.ProcessState>>);
    /**
        WithHandle calls a supplied function f with a valid process handle
        as an argument. The handle is guaranteed to refer to process p
        until f returns, even if p terminates. This function cannot be used
        after [Process.Release] or [Process.Wait].
        
        If process handles are not supported or a handle is not available,
        it returns [ErrNoHandle]. Currently, process handles are supported
        on Linux 5.4 or later (pidfd) and Windows.
    **/
    @:native("WithHandle") function withHandle(f: (handle: go.UIntPtr) -> Void): (go.Error);

}