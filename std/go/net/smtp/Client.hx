package go.net.smtp;

/**
    A Client represents a client connection to an SMTP server.
**/
@:structInit
@:go.Type({ name: "Client", instanceName: "smtp.Client", imports: ["net/smtp"] })
extern class Client {

    @:native("Text") var text: go.Pointer<go.net.textproto.Conn>;

    function new(text: go.Pointer<go.net.textproto.Conn>=null);

    /**
        Auth authenticates a client using the provided authentication mechanism.
        A failed authentication closes the connection.
        Only servers that advertise the AUTH extension support this function.
    **/
    @:native("Auth") function auth(a: go.net.smtp.Auth): (go.Error);
    /**
        Close closes the connection.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Data issues a DATA command to the server and returns a writer that
        can be used to write the mail headers and body. The caller should
        close the writer before calling any more methods on c. A call to
        Data must be preceded by one or more calls to [Client.Rcpt].
    **/
    @:native("Data") function data(): (go.Result<go.io.WriteCloser>);
    /**
        Extension reports whether an extension is support by the server.
        The extension name is case-insensitive. If the extension is supported,
        Extension also returns a string that contains any parameters the
        server specifies for the extension.
    **/
    @:go.Tuple("p0", "p1") @:native("Extension") function extension(ext: String): (go.Tuple<{ p0: Bool, p1: String }>);
    /**
        Hello sends a HELO or EHLO to the server as the given host name.
        Calling this method is only necessary if the client needs control
        over the host name used. The client will introduce itself as "localhost"
        automatically otherwise. If Hello is called, it must be called before
        any of the other methods.
    **/
    @:native("Hello") function hello(localName: String): (go.Error);
    /**
        Mail issues a MAIL command to the server using the provided email address.
        If the server supports the 8BITMIME extension, Mail adds the BODY=8BITMIME
        parameter. If the server supports the SMTPUTF8 extension, Mail adds the
        SMTPUTF8 parameter.
        This initiates a mail transaction and is followed by one or more [Client.Rcpt] calls.
    **/
    @:native("Mail") function mail(_from: String): (go.Error);
    /**
        Noop sends the NOOP command to the server. It does nothing but check
        that the connection to the server is okay.
    **/
    @:native("Noop") function noop(): (go.Error);
    /**
        Quit sends the QUIT command and closes the connection to the server.
    **/
    @:native("Quit") function quit(): (go.Error);
    /**
        Rcpt issues a RCPT command to the server using the provided email address.
        A call to Rcpt must be preceded by a call to [Client.Mail] and may be followed by
        a [Client.Data] call or another Rcpt call.
    **/
    @:native("Rcpt") function rcpt(_to: String): (go.Error);
    /**
        Reset sends the RSET command to the server, aborting the current mail
        transaction.
    **/
    @:native("Reset") function reset(): (go.Error);
    /**
        StartTLS sends the STARTTLS command and encrypts all further communication.
        Only servers that advertise the STARTTLS extension support this function.
    **/
    @:native("StartTLS") function startTLS(config: go.Pointer<go.crypto.tls.Config>): (go.Error);
    /**
        TLSConnectionState returns the client's TLS connection state.
        The return values are their zero values if [Client.StartTLS] did
        not succeed.
    **/
    @:go.Tuple("state", "ok") @:native("TLSConnectionState") function tLSConnectionState(): (go.Tuple<{ state: go.crypto.tls.ConnectionState, ok: Bool }>);
    /**
        Verify checks the validity of an email address on the server.
        If Verify returns nil, the address is valid. A non-nil return
        does not necessarily indicate an invalid address. Many servers
        will not verify addresses for security reasons.
    **/
    @:native("Verify") function verify(addr: String): (go.Error);

}