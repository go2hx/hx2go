package go.net;

/**
    UDPConn is the implementation of the [Conn] and [PacketConn] interfaces
    for UDP network connections.
**/
@:structInit
@:go.Type({ name: "UDPConn", instanceName: "net.UDPConn", imports: ["net"] })
extern class UDPConn {

    /**
        Close closes the connection.
    **/
    @:native("Close") function close(): (go.Error);
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
        ReadFrom implements the [PacketConn] ReadFrom method.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("ReadFrom") function readFrom(b: go.Slice<go.Byte>): (go.Tuple<{ p0: go.GoInt, p1: go.net.Addr, p2: go.Error }>);
    /**
        ReadFromUDP acts like [UDPConn.ReadFrom] but returns a UDPAddr.
    **/
    @:go.Tuple("n", "addr", "err") @:native("ReadFromUDP") function readFromUDP(b: go.Slice<go.Byte>): (go.Tuple<{ n: go.GoInt, addr: go.Pointer<go.net.UDPAddr>, err: go.Error }>);
    /**
        ReadFromUDPAddrPort acts like ReadFrom but returns a [netip.AddrPort].
        
        If c is bound to an unspecified address, the returned
        netip.AddrPort's address might be an IPv4-mapped IPv6 address.
        Use [netip.Addr.Unmap] to get the address without the IPv6 prefix.
    **/
    @:go.Tuple("n", "addr", "err") @:native("ReadFromUDPAddrPort") function readFromUDPAddrPort(b: go.Slice<go.Byte>): (go.Tuple<{ n: go.GoInt, addr: go.net.netip.AddrPort, err: go.Error }>);
    /**
        ReadMsgUDP reads a message from c, copying the payload into b and
        the associated out-of-band data into oob. It returns the number of
        bytes copied into b, the number of bytes copied into oob, the flags
        that were set on the message and the source address of the message.
        
        The packages [golang.org/x/net/ipv4] and [golang.org/x/net/ipv6] can be
        used to manipulate IP-level socket options in oob.
    **/
    @:go.Tuple("n", "oobn", "flags", "addr", "err") @:native("ReadMsgUDP") function readMsgUDP(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>): (go.Tuple<{ n: go.GoInt, oobn: go.GoInt, flags: go.GoInt, addr: go.Pointer<go.net.UDPAddr>, err: go.Error }>);
    /**
        ReadMsgUDPAddrPort is like [UDPConn.ReadMsgUDP] but returns an [netip.AddrPort] instead of a [UDPAddr].
    **/
    @:go.Tuple("n", "oobn", "flags", "addr", "err") @:native("ReadMsgUDPAddrPort") function readMsgUDPAddrPort(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>): (go.Tuple<{ n: go.GoInt, oobn: go.GoInt, flags: go.GoInt, addr: go.net.netip.AddrPort, err: go.Error }>);
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
        WriteMsgUDP writes a message to addr via c if c isn't connected, or
        to c's remote address if c is connected (in which case addr must be
        nil). The payload is copied from b and the associated out-of-band
        data is copied from oob. It returns the number of payload and
        out-of-band bytes written.
        
        The packages [golang.org/x/net/ipv4] and [golang.org/x/net/ipv6] can be
        used to manipulate IP-level socket options in oob.
    **/
    @:go.Tuple("n", "oobn", "err") @:native("WriteMsgUDP") function writeMsgUDP(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, addr: go.Pointer<go.net.UDPAddr>): (go.Tuple<{ n: go.GoInt, oobn: go.GoInt, err: go.Error }>);
    /**
        WriteMsgUDPAddrPort is like [UDPConn.WriteMsgUDP] but takes a [netip.AddrPort] instead of a [UDPAddr].
    **/
    @:go.Tuple("n", "oobn", "err") @:native("WriteMsgUDPAddrPort") function writeMsgUDPAddrPort(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, addr: go.net.netip.AddrPort): (go.Tuple<{ n: go.GoInt, oobn: go.GoInt, err: go.Error }>);
    /**
        WriteTo implements the [PacketConn] WriteTo method.
    **/
    @:native("WriteTo") function writeTo(b: go.Slice<go.Byte>, addr: go.net.Addr): (go.Result<go.GoInt>);
    /**
        WriteToUDP acts like [UDPConn.WriteTo] but takes a [UDPAddr].
    **/
    @:native("WriteToUDP") function writeToUDP(b: go.Slice<go.Byte>, addr: go.Pointer<go.net.UDPAddr>): (go.Result<go.GoInt>);
    /**
        WriteToUDPAddrPort acts like [UDPConn.WriteTo] but takes a [netip.AddrPort].
    **/
    @:native("WriteToUDPAddrPort") function writeToUDPAddrPort(b: go.Slice<go.Byte>, addr: go.net.netip.AddrPort): (go.Result<go.GoInt>);

}