package go.crypto.tls;

@:go.Type({ name: "ClientSessionCache", instanceName: "tls.ClientSessionCache", imports: ["crypto/tls"] })
extern typedef ClientSessionCache = {

    @:go.Tuple("session", "ok") @:native("Get") function get(sessionKey: String): go.Tuple<{ session: go.Pointer<go.crypto.tls.ClientSessionState>, ok: Bool }>;
    @:native("Put") function put(sessionKey: String, cs: go.Pointer<go.crypto.tls.ClientSessionState>): Void;

}