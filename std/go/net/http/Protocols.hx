package go.net.http;

/**
    Protocols is a set of HTTP protocols.
    The zero value is an empty set of protocols.
    
    The supported protocols are:
    
      - HTTP1 is the HTTP/1.0 and HTTP/1.1 protocols.
        HTTP1 is supported on both unsecured TCP and secured TLS connections.
    
      - HTTP2 is the HTTP/2 protcol over a TLS connection.
    
      - UnencryptedHTTP2 is the HTTP/2 protocol over an unsecured TCP connection.
**/
@:structInit
@:go.Type({ name: "Protocols", instanceName: "http.Protocols", imports: ["net/http"] })
extern class Protocols {

    /**
        HTTP1 reports whether p includes HTTP/1.
    **/
    @:native("HTTP1") function HTTP1(): (Bool);
    /**
        HTTP2 reports whether p includes HTTP/2.
    **/
    @:native("HTTP2") function HTTP2(): (Bool);
    /**
        SetHTTP1 adds or removes HTTP/1 from p.
    **/
    @:native("SetHTTP1") function setHTTP1(ok: Bool): Void;
    /**
        SetHTTP2 adds or removes HTTP/2 from p.
    **/
    @:native("SetHTTP2") function setHTTP2(ok: Bool): Void;
    /**
        SetUnencryptedHTTP2 adds or removes unencrypted HTTP/2 from p.
    **/
    @:native("SetUnencryptedHTTP2") function setUnencryptedHTTP2(ok: Bool): Void;
    @:native("String") function string(): (String);
    /**
        UnencryptedHTTP2 reports whether p includes unencrypted HTTP/2.
    **/
    @:native("UnencryptedHTTP2") function unencryptedHTTP2(): (Bool);

}