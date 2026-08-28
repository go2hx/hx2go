package go.net;

/**
    TCPListener is a TCP network listener. Clients should typically
    use variables of type [Listener] instead of assuming TCP.
**/
@:structInit
@:go.Type({ name: "TCPListener", instanceName: "net.TCPListener", imports: ["net"] })
extern class TCPListener {

    /**
        Accept implements the Accept method in the [Listener] interface; it
        waits for the next call and returns a generic [Conn].
    **/
    @:native("Accept") function accept(): (go.Result<go.net.Conn>);
    /**
        AcceptTCP accepts the next incoming call and returns the new
        connection.
    **/
    @:native("AcceptTCP") function acceptTCP(): (go.Result<go.Pointer<go.net.TCPConn>>);
    /**
        Addr returns the listener's network address, a [*TCPAddr].
        The Addr returned is shared by all invocations of Addr, so
        do not modify it.
    **/
    @:native("Addr") function addr(): (go.net.Addr);
    /**
        Close stops listening on the TCP address.
        Already Accepted connections are not closed.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        File returns a copy of the underlying [os.File].
        It is the caller's responsibility to close f when finished.
        Closing l does not affect f, and closing f does not affect l.
        
        The returned os.File's file descriptor is different from the
        connection's. Attempting to change properties of the original
        using this duplicate may or may not have the desired effect.
        
        On Windows, the returned os.File's file descriptor is not
        usable on other processes.
    **/
    @:native("File") function file(): (go.Result<go.Pointer<go.os.File>>);
    /**
        SetDeadline sets the deadline associated with the listener.
        A zero time value disables the deadline.
    **/
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    /**
        SyscallConn returns a raw network connection.
        This implements the [syscall.Conn] interface.
        
        The returned RawConn only supports calling Control. Read and
        Write return an error.
    **/
    @:native("SyscallConn") function syscallConn(): (go.Result<go.syscall.RawConn>);

}