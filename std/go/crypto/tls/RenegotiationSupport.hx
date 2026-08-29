package go.crypto.tls;

/**
    RenegotiationSupport enumerates the different levels of support for TLS
    renegotiation. TLS renegotiation is the act of performing subsequent
    handshakes on a connection after the first. This significantly complicates
    the state machine and has been the source of numerous, subtle security
    issues. Initiating a renegotiation is not supported, but support for
    accepting renegotiation requests may be enabled.
    
    Even when enabled, the server may not change its identity between handshakes
    (i.e. the leaf certificate must be the same). Additionally, concurrent
    handshake and application data flow is not permitted so renegotiation can
    only be used with protocols that synchronise with the renegotiation, such as
    HTTPS.
    
    Renegotiation is not defined in TLS 1.3.
**/
@:go.Type({ name: "RenegotiationSupport", instanceName: "tls.RenegotiationSupport", imports: ["crypto/tls"] })
extern typedef RenegotiationSupport = go.GoInt