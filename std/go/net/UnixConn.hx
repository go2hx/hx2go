package go.net;

/**
    UnixConn is an implementation of the [Conn] interface for connections
    to Unix domain sockets.
**/
@:structInit
@:go.Type({ name: "UnixConn", instanceName: "net.UnixConn", imports: ["net"] })
extern class UnixConn {

    /**
        Close closes the connection.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        CloseRead shuts down the reading side of the Unix domain connection.
        Most callers should just use [UnixConn.Close].
    **/
    @:native("CloseRead") function closeRead(): (go.Error);
    /**
        CloseWrite shuts down the writing side of the Unix domain connection.
        Most callers should just use [UnixConn.Close].
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
        Read implements the Conn Read method.
    **/
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        ReadFrom implements the [PacketConn].ReadFrom method.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("ReadFrom") function readFrom(b: go.Slice<go.Byte>): (go.Tuple<{ p0: go.GoInt, p1: go.net.Addr, p2: go.Error }>);
    /**
        ReadFromUnix acts like [UnixConn.ReadFrom] but returns a [UnixAddr].
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("ReadFromUnix") function readFromUnix(b: go.Slice<go.Byte>): (go.Tuple<{ p0: go.GoInt, p1: go.Pointer<go.net.UnixAddr>, p2: go.Error }>);
    /**
        ReadMsgUnix reads a message from c, copying the payload into b and
        the associated out-of-band data into oob. It returns the number of
        bytes copied into b, the number of bytes copied into oob, the flags
        that were set on the message and the source address of the message.
        
        Note that if len(b) == 0 and len(oob) > 0, this function will still
        read (and discard) 1 byte from the connection.
    **/
    @:go.Tuple("n", "oobn", "flags", "addr", "err") @:native("ReadMsgUnix") function readMsgUnix(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>): (go.Tuple<{ n: go.GoInt, oobn: go.GoInt, flags: go.GoInt, addr: go.Pointer<go.net.UnixAddr>, err: go.Error }>);
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
        WriteMsgUnix writes a message to addr via c, copying the payload
        from b and the associated out-of-band data from oob. It returns the
        number of payload and out-of-band bytes written.
        
        Note that if len(b) == 0 and len(oob) > 0, this function will still
        write 1 byte to the connection.
    **/
    @:go.Tuple("n", "oobn", "err") @:native("WriteMsgUnix") function writeMsgUnix(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, addr: go.Pointer<go.net.UnixAddr>): (go.Tuple<{ n: go.GoInt, oobn: go.GoInt, err: go.Error }>);
    /**
        WriteTo implements the [PacketConn].WriteTo method.
    **/
    @:native("WriteTo") function writeTo(b: go.Slice<go.Byte>, addr: go.net.Addr): (go.Result<go.GoInt>);
    /**
        WriteToUnix acts like [UnixConn.WriteTo] but takes a [UnixAddr].
    **/
    @:native("WriteToUnix") function writeToUnix(b: go.Slice<go.Byte>, addr: go.Pointer<go.net.UnixAddr>): (go.Result<go.GoInt>);

}