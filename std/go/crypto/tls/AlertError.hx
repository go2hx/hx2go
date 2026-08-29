package go.crypto.tls;

/**
    An AlertError is a TLS alert.
    
    When using a QUIC transport, QUICConn methods will return an error
    which wraps AlertError rather than sending a TLS alert.
**/
@:go.Type({ name: "AlertError", instanceName: "tls.AlertError", imports: ["crypto/tls"] })
extern typedef AlertError = haxe.extern.EitherType<go.UInt8, {
    @:native("Error") function error(): (String);

}>