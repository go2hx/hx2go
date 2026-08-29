package go.crypto.tls;

/**
    Dialer dials TLS connections given a configuration and a Dialer for the
    underlying connection.
**/
@:structInit
@:go.Type({ name: "Dialer", instanceName: "tls.Dialer", imports: ["crypto/tls"] })
extern class Dialer {

    @:native("NetDialer") var netDialer: go.Pointer<go.net.Dialer>;
    @:native("Config") var config: go.Pointer<go.crypto.tls.Config>;

    function new(netDialer: go.Pointer<go.net.Dialer>=null, config: go.Pointer<go.crypto.tls.Config>=null);

    /**
        Dial connects to the given network address and initiates a TLS
        handshake, returning the resulting TLS connection.
        
        The returned [Conn], if any, will always be of type *[Conn].
        
        Dial uses context.Background internally; to specify the context,
        use [Dialer.DialContext].
    **/
    @:native("Dial") function dial(network: String, addr: String): (go.Result<go.net.Conn>);
    /**
        DialContext connects to the given network address and initiates a TLS
        handshake, returning the resulting TLS connection.
        
        The provided Context must be non-nil. If the context expires before
        the connection is complete, an error is returned. Once successfully
        connected, any expiration of the context will not affect the
        connection.
        
        The returned [Conn], if any, will always be of type *[Conn].
    **/
    @:native("DialContext") function dialContext(ctx: go.context.Context, network: String, addr: String): (go.Result<go.net.Conn>);

}