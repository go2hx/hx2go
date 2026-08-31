package go.crypto.tls;

/**
    A Conn represents a secured connection.
    It implements the net.Conn interface.
**/
@:structInit
@:go.Type({ name: "Conn", instanceName: "tls.Conn", imports: ["crypto/tls"] })
extern class Conn {

    /**
        Close closes the connection.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        CloseWrite shuts down the writing side of the connection. It should only be
        called once the handshake has completed and does not call CloseWrite on the
        underlying connection. Most callers should just use [Conn.Close].
    **/
    @:native("CloseWrite") function closeWrite(): (go.Error);
    /**
        ConnectionState returns basic TLS details about the connection.
    **/
    @:native("ConnectionState") function connectionState(): (go.crypto.tls.ConnectionState);
    /**
        Handshake runs the client or server handshake
        protocol if it has not yet been run.
        
        Most uses of this package need not call Handshake explicitly: the
        first [Conn.Read] or [Conn.Write] will call it automatically.
        
        For control over canceling or setting a timeout on a handshake, use
        [Conn.HandshakeContext] or the [Dialer]'s DialContext method instead.
        
        In order to avoid denial of service attacks, the maximum RSA key size allowed
        in certificates sent by either the TLS server or client is limited to 8192
        bits. This limit can be overridden by setting tlsmaxrsasize in the GODEBUG
        environment variable (e.g. GODEBUG=tlsmaxrsasize=4096).
    **/
    @:native("Handshake") function handshake(): (go.Error);
    /**
        HandshakeContext runs the client or server handshake
        protocol if it has not yet been run.
        
        The provided Context must be non-nil. If the context is canceled before
        the handshake is complete, the handshake is interrupted and an error is returned.
        Once the handshake has completed, cancellation of the context will not affect the
        connection.
        
        Most uses of this package need not call HandshakeContext explicitly: the
        first [Conn.Read] or [Conn.Write] will call it automatically.
    **/
    @:native("HandshakeContext") function handshakeContext(ctx: go.context.Context): (go.Error);
    /**
        LocalAddr returns the local network address.
    **/
    @:native("LocalAddr") function localAddr(): (go.net.Addr);
    /**
        NetConn returns the underlying connection that is wrapped by c.
        Note that writing to or reading from this connection directly will corrupt the
        TLS session.
    **/
    @:native("NetConn") function netConn(): (go.net.Conn);
    /**
        OCSPResponse returns the stapled OCSP response from the TLS server, if
        any. (Only valid for client connections.)
    **/
    @:native("OCSPResponse") function oCSPResponse(): (go.Slice<go.Byte>);
    /**
        Read reads data from the connection.
        
        As Read calls [Conn.Handshake], in order to prevent indefinite blocking a deadline
        must be set for both Read and [Conn.Write] before Read is called when the handshake
        has not yet completed. See [Conn.SetDeadline], [Conn.SetReadDeadline], and
        [Conn.SetWriteDeadline].
    **/
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        RemoteAddr returns the remote network address.
    **/
    @:native("RemoteAddr") function remoteAddr(): (go.net.Addr);
    /**
        SetDeadline sets the read and write deadlines associated with the connection.
        A zero value for t means [Conn.Read] and [Conn.Write] will not time out.
        After a Write has timed out, the TLS state is corrupt and all future writes will return the same error.
    **/
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    /**
        SetReadDeadline sets the read deadline on the underlying connection.
        A zero value for t means [Conn.Read] will not time out.
    **/
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    /**
        SetWriteDeadline sets the write deadline on the underlying connection.
        A zero value for t means [Conn.Write] will not time out.
        After a [Conn.Write] has timed out, the TLS state is corrupt and all future writes will return the same error.
    **/
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    /**
        VerifyHostname checks that the peer certificate chain is valid for
        connecting to host. If so, it returns nil; if not, it returns an error
        describing the problem.
    **/
    @:native("VerifyHostname") function verifyHostname(host: String): (go.Error);
    /**
        Write writes data to the connection.
        
        As Write calls [Conn.Handshake], in order to prevent indefinite blocking a deadline
        must be set for both [Conn.Read] and Write before Write is called when the handshake
        has not yet completed. See [Conn.SetDeadline], [Conn.SetReadDeadline], and
        [Conn.SetWriteDeadline].
    **/
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}