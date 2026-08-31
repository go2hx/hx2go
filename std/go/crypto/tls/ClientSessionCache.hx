package go.crypto.tls;

/**
    ClientSessionCache is a cache of ClientSessionState objects that can be used
    by a client to resume a TLS session with a given server. ClientSessionCache
    implementations should expect to be called concurrently from different
    goroutines. Up to TLS 1.2, only ticket-based resumption is supported, not
    SessionID-based resumption. In TLS 1.3 they were merged into PSK modes, which
    are supported via this interface.
**/
@:go.Type({ name: "ClientSessionCache", instanceName: "tls.ClientSessionCache", imports: ["crypto/tls"] })
extern typedef ClientSessionCache = {

    @:go.Tuple("session", "ok") @:native("Get") function get(sessionKey: String): (go.Tuple<{ session: go.Pointer<go.crypto.tls.ClientSessionState>, ok: Bool }>);
    @:native("Put") function put(sessionKey: String, cs: go.Pointer<go.crypto.tls.ClientSessionState>): Void;

}