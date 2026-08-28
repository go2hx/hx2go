package go.net;

/**
    Package textproto implements generic support for text-based request/response
    protocols in the style of HTTP, NNTP, and SMTP.
    
    This package enforces the HTTP/1.1 character set defined by
    RFC 9112 for header keys and values.
    
    The package provides:
    
    [Error], which represents a numeric error response from
    a server.
    
    [Pipeline], to manage pipelined requests and responses
    in a client.
    
    [Reader], to read numeric response code lines,
    key: value headers, lines wrapped with leading spaces
    on continuation lines, and whole text blocks ending
    with a dot on a line by itself.
    
    [Writer], to write dot-encoded text blocks.
    
    [Conn], a convenient packaging of [Reader], [Writer], and [Pipeline] for use
    with a single network connection.
**/
@:go.Type({ name: "textproto", instanceName: "textproto.textproto", imports: ["net/textproto"] })
extern class Textproto {

    /**
        CanonicalMIMEHeaderKey returns the canonical format of the
        MIME header key s. The canonicalization converts the first
        letter and any letter following a hyphen to upper case;
        the rest are converted to lowercase. For example, the
        canonical key for "accept-encoding" is "Accept-Encoding".
        MIME header keys are assumed to be ASCII only.
        If s contains a space or invalid header field bytes as
        defined by RFC 9112, it is returned without modifications.
    **/
    @:native("CanonicalMIMEHeaderKey") static function canonicalMIMEHeaderKey(s: String): (String);
    /**
        Dial connects to the given address on the given network using [net.Dial]
        and then returns a new [Conn] for the connection.
    **/
    @:native("Dial") static function dial(network: String, addr: String): (go.Result<go.Pointer<go.net.textproto.Conn>>);
    /**
        NewConn returns a new [Conn] using conn for I/O.
    **/
    @:native("NewConn") static function newConn(conn: go.io.ReadWriteCloser): (go.Pointer<go.net.textproto.Conn>);
    /**
        NewReader returns a new [Reader] reading from r.
        
        To avoid denial of service attacks, the provided [bufio.Reader]
        should be reading from an [io.LimitReader] or similar Reader to bound
        the size of responses.
    **/
    @:native("NewReader") static function newReader(r: go.Pointer<go.bufio.Reader>): (go.Pointer<go.net.textproto.Reader>);
    /**
        NewWriter returns a new [Writer] writing to w.
    **/
    @:native("NewWriter") static function newWriter(w: go.Pointer<go.bufio.Writer>): (go.Pointer<go.net.textproto.Writer>);
    /**
        TrimBytes returns b without leading and trailing ASCII space.
    **/
    @:native("TrimBytes") static function trimBytes(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        TrimString returns s without leading and trailing ASCII space.
    **/
    @:native("TrimString") static function trimString(s: String): (String);

}