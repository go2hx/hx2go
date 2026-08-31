package go.net;

/**
    Package smtp implements the Simple Mail Transfer Protocol as defined in RFC 5321.
    It also implements the following extensions:
    
    	8BITMIME  RFC 1652
    	AUTH      RFC 2554
    	STARTTLS  RFC 3207
    
    Additional extensions may be handled by clients.
    
    The smtp package is frozen and is not accepting new features.
    Some external packages provide more functionality. See:
    
    	https://godoc.org/?q=smtp
**/
@:go.Type({ name: "smtp", instanceName: "smtp.smtp", imports: ["net/smtp"] })
extern class Smtp {

    /**
        CRAMMD5Auth returns an [Auth] that implements the CRAM-MD5 authentication
        mechanism as defined in RFC 2195.
        The returned Auth uses the given username and secret to authenticate
        to the server using the challenge-response mechanism.
    **/
    @:native("CRAMMD5Auth") static function cRAMMD5Auth(username: String, secret: String): (go.net.smtp.Auth);
    /**
        Dial returns a new [Client] connected to an SMTP server at addr.
        The addr must include a port, as in "mail.example.com:smtp".
    **/
    @:native("Dial") static function dial(addr: String): (go.Result<go.Pointer<go.net.smtp.Client>>);
    /**
        NewClient returns a new [Client] using an existing connection and host as a
        server name to be used when authenticating.
    **/
    @:native("NewClient") static function newClient(conn: go.net.Conn, host: String): (go.Result<go.Pointer<go.net.smtp.Client>>);
    /**
        PlainAuth returns an [Auth] that implements the PLAIN authentication
        mechanism as defined in RFC 4616. The returned Auth uses the given
        username and password to authenticate to host and act as identity.
        Usually identity should be the empty string, to act as username.
        
        PlainAuth will only send the credentials if the connection is using TLS
        or is connected to localhost. Otherwise authentication will fail with an
        error, without sending the credentials.
    **/
    @:native("PlainAuth") static function plainAuth(identity: String, username: String, password: String, host: String): (go.net.smtp.Auth);
    /**
        SendMail connects to the server at addr, switches to TLS if
        possible, authenticates with the optional mechanism a if possible,
        and then sends an email from address from, to addresses to, with
        message msg.
        The addr must include a port, as in "mail.example.com:smtp".
        
        The addresses in the to parameter are the SMTP RCPT addresses.
        
        The msg parameter should be an RFC 822-style email with headers
        first, a blank line, and then the message body. The lines of msg
        should be CRLF terminated. The msg headers should usually include
        fields such as "From", "To", "Subject", and "Cc".  Sending "Bcc"
        messages is accomplished by including an email address in the to
        parameter but not including it in the msg headers.
        
        The SendMail function and the net/smtp package are low-level
        mechanisms and provide no support for DKIM signing, MIME
        attachments (see the mime/multipart package), or other mail
        functionality. Higher-level packages exist outside of the standard
        library.
    **/
    @:native("SendMail") static function sendMail(addr: String, a: go.net.smtp.Auth, _from: String, _to: go.Slice<String>, msg: go.Slice<go.Byte>): (go.Error);

}