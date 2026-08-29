package go.net;

/**
    TCPConn is an implementation of the [Conn] interface for TCP network
    connections.
**/
@:structInit
@:go.Type({ name: "TCPConn", instanceName: "net.TCPConn", imports: ["net"] })
extern class TCPConn {

    /**
        Close closes the connection.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        CloseRead shuts down the reading side of the TCP connection.
        Most callers should just use Close.
    **/
    @:native("CloseRead") function closeRead(): (go.Error);
    /**
        CloseWrite shuts down the writing side of the TCP connection.
        Most callers should just use Close.
    **/
    @:native("CloseWrite") function closeWrite(): (go.Error);
    /**
        File returns a copy of the underlying [os.File].
        It is the caller's responsibility to close f when finished.
        Closing c does not affect f, and closing f does not affect c.
        
        The returned os.File's file descriptor is different from the connection's.
        Attempting to change properties of the original using this duplicate
        may or may not have the desired effect.
        
        On Windows, the returned os.File's file descriptor is not usable
        on other processes.
    **/
    @:native("File") function file(): (go.Result<go.Pointer<go.os.File>>);
    /**
        LocalAddr returns the local network address.
        The Addr returned is shared by all invocations of LocalAddr, so
        do not modify it.
    **/
    @:native("LocalAddr") function localAddr(): (go.net.Addr);
    /**
        MultipathTCP reports whether the ongoing connection is using MPTCP.
        
        If Multipath TCP is not supported by the host, by the other peer or
        intentionally / accidentally filtered out by a device in between, a
        fallback to TCP will be done. This method does its best to check if
        MPTCP is still being used or not.
        
        On Linux, more conditions are verified on kernels >= v5.16, improving
        the results.
    **/
    @:native("MultipathTCP") function multipathTCP(): (go.Result<Bool>);
    /**
        Read implements the Conn Read method.
    **/
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        ReadFrom implements the [io.ReaderFrom] ReadFrom method.
    **/
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    /**
        RemoteAddr returns the remote network address.
        The Addr returned is shared by all invocations of RemoteAddr, so
        do not modify it.
    **/
    @:native("RemoteAddr") function remoteAddr(): (go.net.Addr);
    /**
        SetDeadline implements the Conn SetDeadline method.
    **/
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    /**
        SetKeepAlive sets whether the operating system should send
        keep-alive messages on the connection.
    **/
    @:native("SetKeepAlive") function setKeepAlive(keepalive: Bool): (go.Error);
    /**
        SetKeepAliveConfig configures keep-alive messages sent by the operating system.
    **/
    @:native("SetKeepAliveConfig") function setKeepAliveConfig(config: go.net.KeepAliveConfig): (go.Error);
    /**
        SetKeepAlivePeriod sets the duration the connection needs to
        remain idle before TCP starts sending keepalive probes.
        
        Note that calling this method on Windows prior to Windows 10 version 1709
        will reset the KeepAliveInterval to the default system value, which is normally 1 second.
    **/
    @:native("SetKeepAlivePeriod") function setKeepAlivePeriod(d: go.time.Duration): (go.Error);
    /**
        SetLinger sets the behavior of Close on a connection which still
        has data waiting to be sent or to be acknowledged.
        
        If sec < 0 (the default), the operating system finishes sending the
        data in the background.
        
        If sec == 0, the operating system discards any unsent or
        unacknowledged data.
        
        If sec > 0, the data is sent in the background as with sec < 0.
        On some operating systems including Linux, this may cause Close to block
        until all data has been sent or discarded.
        On some operating systems after sec seconds have elapsed any remaining
        unsent data may be discarded.
    **/
    @:native("SetLinger") function setLinger(sec: go.GoInt): (go.Error);
    /**
        SetNoDelay controls whether the operating system should delay
        packet transmission in hopes of sending fewer packets (Nagle's
        algorithm).  The default is true (no delay), meaning that data is
        sent as soon as possible after a Write.
    **/
    @:native("SetNoDelay") function setNoDelay(noDelay: Bool): (go.Error);
    /**
        SetReadBuffer sets the size of the operating system's
        receive buffer associated with the connection.
    **/
    @:native("SetReadBuffer") function setReadBuffer(bytes: go.GoInt): (go.Error);
    /**
        SetReadDeadline implements the Conn SetReadDeadline method.
    **/
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    /**
        SetWriteBuffer sets the size of the operating system's
        transmit buffer associated with the connection.
    **/
    @:native("SetWriteBuffer") function setWriteBuffer(bytes: go.GoInt): (go.Error);
    /**
        SetWriteDeadline implements the Conn SetWriteDeadline method.
    **/
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    /**
        SyscallConn returns a raw network connection.
        This implements the [syscall.Conn] interface.
    **/
    @:native("SyscallConn") function syscallConn(): (go.Result<go.syscall.RawConn>);
    /**
        Write implements the Conn Write method.
    **/
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteTo implements the io.WriterTo WriteTo method.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}