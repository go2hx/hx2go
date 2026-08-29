package go.net;

/**
    UnixListener is a Unix domain socket listener. Clients should
    typically use variables of type [Listener] instead of assuming Unix
    domain sockets.
**/
@:structInit
@:go.Type({ name: "UnixListener", instanceName: "net.UnixListener", imports: ["net"] })
extern class UnixListener {

    /**
        Accept implements the Accept method in the [Listener] interface.
        Returned connections will be of type [*UnixConn].
    **/
    @:native("Accept") function accept(): (go.Result<go.net.Conn>);
    /**
        AcceptUnix accepts the next incoming call and returns the new
        connection.
    **/
    @:native("AcceptUnix") function acceptUnix(): (go.Result<go.Pointer<go.net.UnixConn>>);
    /**
        Addr returns the listener's network address.
        The [Addr] returned is shared by all invocations of Addr, so
        do not modify it.
    **/
    @:native("Addr") function addr(): (go.net.Addr);
    /**
        Close stops listening on the Unix address. Already accepted
        connections are not closed.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        File returns a copy of the underlying [os.File].
        It is the caller's responsibility to close f when finished.
        Closing l does not affect f, and closing f does not affect l.
        
        The returned [os.File]'s file descriptor is different from the
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
        SetUnlinkOnClose sets whether the underlying socket file should be removed
        from the file system when the listener is closed.
        
        The default behavior is to unlink the socket file only when package net created it.
        That is, when the listener and the underlying socket file were created by a call to
        Listen or ListenUnix, then by default closing the listener will remove the socket file.
        but if the listener was created by a call to FileListener to use an already existing
        socket file, then by default closing the listener will not remove the socket file.
    **/
    @:native("SetUnlinkOnClose") function setUnlinkOnClose(unlink: Bool): Void;
    /**
        SyscallConn returns a raw network connection.
        This implements the [syscall.Conn] interface.
        
        The returned [syscall.RawConn] only supports calling Control. Read and
        Write return an error.
    **/
    @:native("SyscallConn") function syscallConn(): (go.Result<go.syscall.RawConn>);

}