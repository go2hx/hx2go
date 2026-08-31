package go.os;

/**
    ProcessState stores information about a process, as reported by Wait.
**/
@:structInit
@:go.Type({ name: "ProcessState", instanceName: "os.ProcessState", imports: ["os"] })
extern class ProcessState {

    /**
        ExitCode returns the exit code of the exited process, or -1
        if the process hasn't exited or was terminated by a signal.
    **/
    @:native("ExitCode") function exitCode(): (go.GoInt);
    /**
        Exited reports whether the program has exited.
        On Unix systems this reports true if the program exited due to calling exit,
        but false if the program terminated due to a signal.
    **/
    @:native("Exited") function exited(): (Bool);
    /**
        Pid returns the process id of the exited process.
    **/
    @:native("Pid") function pid(): (go.GoInt);
    @:native("String") function string(): (String);
    /**
        Success reports whether the program exited successfully,
        such as with exit status 0 on Unix.
    **/
    @:native("Success") function success(): (Bool);
    /**
        Sys returns system-dependent exit information about
        the process. Convert it to the appropriate underlying
        type, such as [syscall.WaitStatus] on Unix, to access its contents.
    **/
    @:native("Sys") function sys(): (Dynamic);
    /**
        SysUsage returns system-dependent resource usage information about
        the exited process. Convert it to the appropriate underlying
        type, such as [*syscall.Rusage] on Unix, to access its contents.
        (On Unix, *syscall.Rusage matches struct rusage as defined in the
        getrusage(2) manual page.)
    **/
    @:native("SysUsage") function sysUsage(): (Dynamic);
    /**
        SystemTime returns the system CPU time of the exited process and its children.
    **/
    @:native("SystemTime") function systemTime(): (go.time.Duration);
    /**
        UserTime returns the user CPU time of the exited process and its children.
    **/
    @:native("UserTime") function userTime(): (go.time.Duration);

}